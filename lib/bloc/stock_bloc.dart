import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/stock_query.dart';
import '../data/stock_repository.dart';
import '../models/stock.dart';
import 'stock_event.dart';
import 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  StockBloc(this._repository)
    : super(
        StockState.initial(supportedCountries: _repository.supportedCountries),
      ) {
    on<StockInitialized>(_onInitialized);
    on<StockRefreshRequested>(_onRefreshRequested);
    on<StockLoadMoreRequested>(_onLoadMoreRequested);
    on<StockSearchChanged>(_onSearchChanged);
    on<StockComplianceChanged>(_onComplianceChanged);
    on<StockCountryChanged>(_onCountryChanged);

    add(const StockInitialized());
  }

  static const int _perPage = 20;

  final StockRepository _repository;

  Future<void> _onInitialized(
    StockInitialized event,
    Emitter<StockState> emit,
  ) async {
    await _loadStocks(emit, reset: true);
  }

  Future<void> _onRefreshRequested(
    StockRefreshRequested event,
    Emitter<StockState> emit,
  ) async {
    await _loadStocks(emit, reset: true);
  }

  Future<void> _onLoadMoreRequested(
    StockLoadMoreRequested event,
    Emitter<StockState> emit,
  ) async {
    if (state.isLoadingMore || state.hasReachedEnd || state.isInitialLoading) {
      return;
    }
    await _loadStocks(emit, reset: false);
  }

  Future<void> _onSearchChanged(
    StockSearchChanged event,
    Emitter<StockState> emit,
  ) async {
    emit(
      state.copyWith(
        search: event.query,
        hasReachedEnd: false,
        page: 1,
        errorMessage: null,
      ),
    );
    await _loadStocks(emit, reset: true);
  }

  Future<void> _onComplianceChanged(
    StockComplianceChanged event,
    Emitter<StockState> emit,
  ) async {
    emit(
      state.copyWith(
        compliance: event.compliance,
        hasReachedEnd: false,
        page: 1,
        errorMessage: null,
      ),
    );
    await _loadStocks(emit, reset: true);
  }

  Future<void> _onCountryChanged(
    StockCountryChanged event,
    Emitter<StockState> emit,
  ) async {
    emit(
      state.copyWith(
        countryCode: event.countryCode,
        hasReachedEnd: false,
        page: 1,
        errorMessage: null,
      ),
    );
    await _loadStocks(emit, reset: true);
  }

  Future<void> _loadStocks(
    Emitter<StockState> emit, {
    required bool reset,
  }) async {
    final nextPage = reset ? 1 : state.page + 1;

    if (reset) {
      emit(
        state.copyWith(
          status: StockStatus.loading,
          isLoadingMore: false,
          hasReachedEnd: false,
          errorMessage: null,
        ),
      );
    } else {
      emit(state.copyWith(isLoadingMore: true, errorMessage: null));
    }

    try {
      final response = await _repository.fetchStocks(
        StockQuery(
          compliance: state.compliance,
          search: state.search,
          countryCode: state.countryCode,
          page: nextPage,
          perPage: _perPage,
        ),
      );

      final combinedStocks = reset
          ? response.data
          : <Stock>[...state.stocks, ...response.data];

      emit(
        state.copyWith(
          status: StockStatus.success,
          stocks: combinedStocks,
          page: nextPage,
          totalCount: response.count,
          hasReachedEnd:
              combinedStocks.length >= response.count || response.data.isEmpty,
          isLoadingMore: false,
          usingMockData: response.fromMock,
          errorMessage: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: state.stocks.isEmpty
              ? StockStatus.failure
              : StockStatus.success,
          isLoadingMore: false,
          errorMessage: 'Failed to load stocks.',
        ),
      );
    }
  }
}

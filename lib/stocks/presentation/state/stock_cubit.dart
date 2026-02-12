import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:stock_investment_app/stocks/data/models/stock_model.dart';
import 'package:stock_investment_app/stocks/data/stock_repository.dart';

part 'stock_cubit.freezed.dart';

@injectable
class StockCubit extends Cubit<StockState> {
  StockCubit(this._stockRepository) : super(const StockState());

  final StockRepository _stockRepository;

  String _query = '';
  FilterOptions _filterOptions = const FilterOptions();

  Future<void> init() async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final stocks = await _stockRepository.getAllStocks();
      final filteredStocks = _applyFilters(stocks);

      emit(
        state.copyWith(
          isLoading: false,
          error: null,
          stockCount: filteredStocks.length,
          allStocks: stocks,
          filteredStocks: filteredStocks,
        ),
      );
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(
        state.copyWith(
          isLoading: false,
          error: error.toString(),
        ),
      );
    }
  }

  void search(String query) {
    _query = query.trim().toLowerCase();
    _emitFilteredStocks();
  }

  void filter(FilterOptions filterOptions) {
    _filterOptions = filterOptions;
    _emitFilteredStocks();
  }

  void _emitFilteredStocks() {
    final stocks = state.allStocks;
    if (stocks == null) {
      return;
    }

    final filteredStocks = _applyFilters(stocks);
    emit(
      state.copyWith(
        stockCount: filteredStocks.length,
        filteredStocks: filteredStocks,
      ),
    );
  }

  List<StockModel> _applyFilters(List<StockModel> stocks) {
    final countryFilter = _filterOptions.filterByCountry?.trim().toLowerCase();

    return stocks.where((stock) {
      final matchesQuery =
          _query.isEmpty ||
          stock.companyName.toLowerCase().contains(_query) ||
          stock.tradingSymbol.toLowerCase().contains(_query);

      final matchesCountry =
          countryFilter == null || countryFilter.isEmpty || stock.currency.toLowerCase() == countryFilter;

      final matchesCompliance = switch (_filterOptions.filterByCompliance) {
        null => true,
        Compliance.comnpliant => stock.shariahCheck && stock.isCompliant,
        Compliance.nonCompliant => stock.shariahCheck && !stock.isCompliant,
        Compliance.notStated => !stock.shariahCheck,
      };

      return matchesQuery && matchesCountry && matchesCompliance;
    }).toList();
  }
}

enum Compliance {
  comnpliant,
  nonCompliant,
  notStated,
}

@freezed
abstract class FilterOptions with _$FilterOptions {
  const factory FilterOptions({
    String? filterByCountry,
    Compliance? filterByCompliance,
  }) = _FilterOptions;
}

@freezed
abstract class StockState with _$StockState {
  const factory StockState({
    @Default(false) bool isLoading,
    String? error,
    int? stockCount,
    List<StockModel>? allStocks,
    List<StockModel>? filteredStocks,
  }) = _StockState;
}

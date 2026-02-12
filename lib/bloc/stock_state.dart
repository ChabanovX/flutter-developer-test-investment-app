import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/stock.dart';

part 'stock_state.freezed.dart';

enum StockStatus { initial, loading, success, failure }

@freezed
abstract class StockState with _$StockState {
  const StockState._();

  const factory StockState({
    required StockStatus status,
    required List<Stock> stocks,
    required List<String> supportedCountries,
    required String search,
    bool? compliance,
    String? countryCode,
    required int page,
    required int totalCount,
    required bool hasReachedEnd,
    required bool isLoadingMore,
    required bool usingMockData,
    String? errorMessage,
  }) = _StockState;

  factory StockState.initial({required List<String> supportedCountries}) {
    return StockState(
      status: StockStatus.initial,
      stocks: const <Stock>[],
      supportedCountries: supportedCountries,
      search: '',
      compliance: null,
      countryCode: null,
      page: 1,
      totalCount: 0,
      hasReachedEnd: false,
      isLoadingMore: false,
      usingMockData: false,
    );
  }

  bool get isInitialLoading =>
      status == StockStatus.loading && stocks.isEmpty && !isLoadingMore;
}

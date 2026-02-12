import 'package:injectable/injectable.dart';
import 'package:stock_investment_app/stocks/data/models/stock_model.dart';
import 'package:stock_investment_app/stocks/data/stock_data.dart';

@singleton
class StockRepository {
  StockRepository(this._stockData);

  final StockData _stockData;

  late final StockResponse _response = StockResponse.fromJson(_stockData.json);

  Future<List<StockModel>> getAllStocks() async {
    await _simulateDelay();
    return _response.data;
  }

  Future<List<StockModel>> getPaginatedStocks({
    required int page,
    required int perPage,
  }) async {
    if (page < 1) {
      throw ArgumentError.value(page, 'page', 'Must be greater than 0.');
    }

    if (perPage < 1) {
      throw ArgumentError.value(perPage, 'perPage', 'Must be greater than 0.');
    }

    await _simulateDelay();

    final startIndex = (page - 1) * perPage;
    if (startIndex >= _response.data.length) {
      return const [];
    }

    final endIndex = startIndex + perPage;
    final cappedEndIndex = endIndex > _response.data.length ? _response.data.length : endIndex;

    return _response.data.sublist(startIndex, cappedEndIndex);
  }

  Future<void> _simulateDelay() => Future<void>.delayed(const Duration(seconds: 2));
}

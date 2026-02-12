import 'package:flutter_test/flutter_test.dart';
import 'package:stock_investment_app/stocks/data/stock_data.dart';
import 'package:stock_investment_app/stocks/data/stock_repository.dart';

void main() {
  group('StockRepository', () {
    late StockRepository repository;

    setUp(() {
      repository = StockRepository(const StockData());
    });

    test('getAllStocks returns all available stocks', () async {
      final result = await repository.getAllStocks();

      expect(result, hasLength(50));
      expect(result.first.tradingSymbol, 'AMST');
      expect(result.last.tradingSymbol, 'STK50');
    });

    test('getPaginatedStocks returns the requested page', () async {
      final firstPage = await repository.getPaginatedStocks(page: 1, perPage: 10);
      final secondPage = await repository.getPaginatedStocks(page: 2, perPage: 10);

      expect(firstPage, hasLength(10));
      expect(firstPage.first.tradingSymbol, 'AMST');
      expect(firstPage.last.tradingSymbol, 'STK10');

      expect(secondPage, hasLength(10));
      expect(secondPage.first.tradingSymbol, 'STK11');
      expect(secondPage.last.tradingSymbol, 'STK20');
    });

    test('getPaginatedStocks returns empty list for out-of-range page', () async {
      final result = await repository.getPaginatedStocks(page: 100, perPage: 10);

      expect(result, isEmpty);
    });

    test('getPaginatedStocks validates page and perPage', () async {
      await expectLater(
        repository.getPaginatedStocks(page: 0, perPage: 10),
        throwsArgumentError,
      );

      await expectLater(
        repository.getPaginatedStocks(page: 1, perPage: 0),
        throwsArgumentError,
      );
    });
  });
}

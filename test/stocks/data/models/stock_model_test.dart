import 'package:flutter_test/flutter_test.dart';
import 'package:stock_investment_app/stocks/data/models/stock_model.dart';

void main() {
  group('StockResponse Freezed model', () {
    const json = {
      'data': [
        {
          'id': 2864,
          'companyName': 'Amesite Inc',
          'tradingSymbol': 'AMST',
          'logo': 'https://ailatapi.kz/media/logos/AMST.png',
          'currency': 'USD',
          'shariahCheck': true,
          'analysisDate': '2025-05-18T00:38:07.000Z',
          'isCompliant': false,
          'price': {
            'price': 2.78,
            'changePercent': -7.95,
          },
        },
      ],
      'meta': {
        'count': 334,
      },
    };

    test('fromJson parses all nested fields correctly', () {
      final response = StockResponse.fromJson(json);
      final stock = response.data.first;

      expect(response.data, hasLength(1));
      expect(response.meta.count, 334);

      expect(stock.id, 2864);
      expect(stock.companyName, 'Amesite Inc');
      expect(stock.tradingSymbol, 'AMST');
      expect(stock.logo, 'https://ailatapi.kz/media/logos/AMST.png');
      expect(stock.currency, 'USD');
      expect(stock.shariahCheck, isTrue);
      expect(stock.analysisDate, DateTime.parse('2025-05-18T00:38:07.000Z'));
      expect(stock.isCompliant, isFalse);
      expect(stock.price.price, 2.78);
      expect(stock.price.changePercent, -7.95);
    });

    test('toJson serializes back to expected structure', () {
      final response = StockResponse.fromJson(json);
      final serialized = response.toJson();
      final meta = serialized['meta'] as Map<String, dynamic>;
      final data = serialized['data'] as List<dynamic>;
      final firstStock = data.first as Map<String, dynamic>;
      final price = firstStock['price'] as Map<String, dynamic>;

      expect(meta['count'], 334);
      expect(data, hasLength(1));
      expect(firstStock['id'], 2864);
      expect(firstStock['tradingSymbol'], 'AMST');
      expect(price['price'], 2.78);
      expect(price['changePercent'], -7.95);
    });
  });
}

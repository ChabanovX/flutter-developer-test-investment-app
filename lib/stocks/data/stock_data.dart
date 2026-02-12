import 'package:injectable/injectable.dart';

@singleton
class StockData {
  const StockData();

  Map<String, dynamic> get json {
    final stocks = List.generate(50, _buildStock);

    return {
      'data': stocks,
      'meta': {'count': stocks.length},
    };
  }

  Map<String, dynamic> _buildStock(int index) {
    if (index == 0) {
      return {
        'id': 2864,
        'companyName': 'Amesite Inc',
        'tradingSymbol': 'AMST',
        'logo': 'https://ailatapi.kz/media/logos/AMST.png',
        'currency': 'USD',
        'shariahCheck': true,
        'analysisDate': '2025-05-18T00:38:07.000Z',
        'isCompliant': false,
        'price': {'price': 2.78, 'changePercent': -7.95},
      };
    }

    final itemNumber = index + 1;
    final symbol = 'STK${itemNumber.toString().padLeft(2, '0')}';
    final basePrice = 2.78 + (index * 0.83);
    final changePercent = (index.isEven ? 1 : -1) * (2.15 + ((index % 5) * 1.1));
    final analysisDate = DateTime.utc(2025, 5, 18).add(Duration(hours: index * 2));

    return {
      'id': 2864 + index,
      'companyName': 'Mock Company $itemNumber',
      'tradingSymbol': symbol,
      'logo': 'https://ailatapi.kz/media/logos/$symbol.png',
      'currency': 'USD',
      'shariahCheck': index.isEven,
      'analysisDate': analysisDate.toIso8601String(),
      'isCompliant': index % 3 != 0,
      'price': {
        'price': double.parse(basePrice.toStringAsFixed(2)),
        'changePercent': double.parse(changePercent.toStringAsFixed(2)),
      },
    };
  }
}

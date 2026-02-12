class Stock {
  const Stock({
    required this.id,
    required this.companyName,
    required this.tradingSymbol,
    required this.logo,
    required this.currency,
    required this.shariahCheck,
    required this.analysisDate,
    required this.isCompliant,
    required this.price,
    this.countryCode,
  });

  final int id;
  final String companyName;
  final String tradingSymbol;
  final String logo;
  final String currency;
  final bool shariahCheck;
  final DateTime analysisDate;
  final bool isCompliant;
  final StockPrice price;
  final String? countryCode;

  factory Stock.fromJson(Map<String, dynamic> json) {
    final rawPrice = json['price'];
    final priceJson =
        rawPrice is Map<String, dynamic> ? rawPrice : const <String, dynamic>{};

    final rawCountry = json['country'];
    String? countryCode;
    if (rawCountry is String && rawCountry.trim().isNotEmpty) {
      countryCode = rawCountry.toUpperCase();
    } else if (rawCountry is Map<String, dynamic>) {
      final code = rawCountry['code'] ??
          rawCountry['iso2'] ??
          rawCountry['isoCode'] ??
          rawCountry['alpha2'];
      if (code is String && code.trim().isNotEmpty) {
        countryCode = code.toUpperCase();
      }
    }

    final rawId = json['id'];
    final rawPriceValue = json['price'];

    return Stock(
      id: rawId is num ? rawId.toInt() : 0,
      companyName: (json['companyName'] as String?)?.trim().isNotEmpty == true
          ? (json['companyName'] as String).trim()
          : 'Unknown company',
      tradingSymbol:
          (json['tradingSymbol'] as String?)?.trim().isNotEmpty == true
              ? (json['tradingSymbol'] as String).trim()
              : 'N/A',
      logo: (json['logo'] as String?) ?? '',
      currency: (json['currency'] as String?) ?? 'USD',
      shariahCheck: json['shariahCheck'] == true,
      analysisDate: DateTime.tryParse(json['analysisDate'] as String? ?? '') ??
          DateTime.now(),
      isCompliant: json['isCompliant'] == true,
      price: rawPriceValue is Map<String, dynamic>
          ? StockPrice.fromJson(priceJson)
          : const StockPrice(price: 0, changePercent: 0),
      countryCode: countryCode,
    );
  }
}

class StockPrice {
  const StockPrice({
    required this.price,
    required this.changePercent,
  });

  final double price;
  final double changePercent;

  factory StockPrice.fromJson(Map<String, dynamic> json) {
    final rawPrice = json['price'];
    final rawChange = json['changePercent'];

    return StockPrice(
      price: rawPrice is num ? rawPrice.toDouble() : 0,
      changePercent: rawChange is num ? rawChange.toDouble() : 0,
    );
  }
}

class StockResponse {
  const StockResponse({
    required this.data,
    required this.count,
    required this.fromMock,
  });

  final List<Stock> data;
  final int count;
  final bool fromMock;
}

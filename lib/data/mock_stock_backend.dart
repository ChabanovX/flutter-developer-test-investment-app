import '../models/stock.dart';
import 'stock_query.dart';

class MockStockBackend {
  MockStockBackend() : _stocks = _buildStocks();

  final List<Stock> _stocks;

  List<String> get supportedCountries {
    final countries = _stocks
        .map((stock) => stock.countryCode)
        .whereType<String>()
        .toSet()
        .toList()
      ..sort();
    return countries;
  }

  Future<StockResponse> fetchStocks(StockQuery query) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));

    final searchQuery = query.search.trim().toLowerCase();
    final countryQuery = query.countryCode?.trim().toUpperCase();

    final filtered = _stocks.where((stock) {
      if (query.compliance != null && stock.isCompliant != query.compliance) {
        return false;
      }
      if (countryQuery != null &&
          countryQuery.isNotEmpty &&
          stock.countryCode != countryQuery) {
        return false;
      }
      if (searchQuery.isNotEmpty) {
        final normalizedName = stock.companyName.toLowerCase();
        final normalizedSymbol = stock.tradingSymbol.toLowerCase();
        if (!normalizedName.contains(searchQuery) &&
            !normalizedSymbol.contains(searchQuery)) {
          return false;
        }
      }
      return true;
    }).toList();

    final totalCount = filtered.length;
    final offset = (query.page - 1) * query.perPage;

    if (offset >= totalCount) {
      return StockResponse(
        data: <Stock>[],
        count: totalCount,
        fromMock: true,
      );
    }

    final pageItems = filtered.skip(offset).take(query.perPage).toList();
    return StockResponse(
      data: pageItems,
      count: totalCount,
      fromMock: true,
    );
  }

  static List<Stock> _buildStocks() {
    final seeds = <_CompanySeed>[
      const _CompanySeed('Apple Inc.', 'AAPL', 'apple.com', 'US'),
      const _CompanySeed('Microsoft Corp.', 'MSFT', 'microsoft.com', 'US'),
      const _CompanySeed('Alphabet Inc.', 'GOOGL', 'abc.xyz', 'US'),
      const _CompanySeed('Amazon.com Inc.', 'AMZN', 'amazon.com', 'US'),
      const _CompanySeed('NVIDIA Corp.', 'NVDA', 'nvidia.com', 'US'),
      const _CompanySeed('Tesla Inc.', 'TSLA', 'tesla.com', 'US'),
      const _CompanySeed('Meta Platforms', 'META', 'meta.com', 'US'),
      const _CompanySeed('Netflix Inc.', 'NFLX', 'netflix.com', 'US'),
      const _CompanySeed('Shopify Inc.', 'SHOP', 'shopify.com', 'CA'),
      const _CompanySeed('BlackBerry Ltd.', 'BB', 'blackberry.com', 'CA'),
      const _CompanySeed('Alibaba Group', 'BABA', 'alibaba.com', 'CN'),
      const _CompanySeed('Baidu Inc.', 'BIDU', 'baidu.com', 'CN'),
      const _CompanySeed('Tencent Holdings', 'TCEHY', 'tencent.com', 'HK'),
      const _CompanySeed('HSBC Holdings', 'HSBC', 'hsbc.com', 'HK'),
      const _CompanySeed('ING Groep', 'ING', 'ing.com', 'NL'),
      const _CompanySeed('Prosus N.V.', 'PROSY', 'prosus.com', 'NL'),
      const _CompanySeed('Novartis AG', 'NVS', 'novartis.com', 'CH'),
      const _CompanySeed('UBS Group', 'UBS', 'ubs.com', 'CH'),
      const _CompanySeed('ArcelorMittal', 'MT', 'arcelormittal.com', 'LU'),
      const _CompanySeed('Spotify Technology', 'SPOT', 'spotify.com', 'LU'),
      const _CompanySeed('Aptiv PLC', 'APTV', 'aptiv.com', 'JE'),
      const _CompanySeed('Wizz Air Holdings', 'WIZZ', 'wizzair.com', 'JE'),
      const _CompanySeed('Halyk Bank', 'HSBK', 'halykbank.kz', 'KZ'),
      const _CompanySeed('Kaspi.kz', 'KSPI', 'kaspi.kz', 'KZ'),
      const _CompanySeed('Ryanair Holdings', 'RYAAY', 'ryanair.com', 'IE'),
      const _CompanySeed('Kerry Group', 'KRYAY', 'kerry.com', 'IE'),
      const _CompanySeed('Bunge Global', 'BG', 'bunge.com', 'BM'),
      const _CompanySeed('RenaissanceRe', 'RNR', 'renre.com', 'BM'),
      const _CompanySeed(
          'Butterfield Bank', 'NTB', 'butterfieldgroup.com', 'BM'),
      const _CompanySeed('Everest Re Group', 'EG', 'everestre.com', 'BM'),
      const _CompanySeed('Brookfield Corp', 'BN', 'brookfield.com', 'CA'),
      const _CompanySeed('Nutrien Ltd', 'NTR', 'nutrien.com', 'CA'),
      const _CompanySeed('CK Hutchison', 'CKHUY', 'ckh.com.hk', 'HK'),
      const _CompanySeed('AIA Group', 'AAGIY', 'aia.com', 'HK'),
      const _CompanySeed('JD.com', 'JD', 'jd.com', 'CN'),
      const _CompanySeed('Pinduoduo', 'PDD', 'pinduoduo.com', 'CN'),
      const _CompanySeed('Bilibili Inc.', 'BILI', 'bilibili.com', 'CN'),
      const _CompanySeed('Cemex SAB', 'CX', 'cemex.com', 'PA'),
      const _CompanySeed('Copa Holdings', 'CPA', 'copaair.com', 'PA'),
      const _CompanySeed('Grupo Aval', 'AVAL', 'grupoaval.com', 'PA'),
      const _CompanySeed('Capital Union Bank', 'CUBL', 'cubl.com', 'KY'),
      const _CompanySeed('Cayman National', 'CNC', 'cnb.ky', 'KY'),
      const _CompanySeed('MVB Financial', 'MVBF', 'mvbbanking.com', 'VG'),
      const _CompanySeed('Mitsui & Co.', 'MITSY', 'mitsui.com', 'VG'),
      const _CompanySeed(
          'Amerigo Resources', 'ARREF', 'amerigoresources.com', 'VG'),
      const _CompanySeed('Bank of Cyprus', 'BOCH', 'bankofcyprus.com', 'AN'),
      const _CompanySeed('Caribbean Utilities', 'CUP', 'fortisinc.com', 'AN'),
      const _CompanySeed('Cayman Islands REIT', 'CIRE', 'example.com', 'AN'),
      const _CompanySeed('Liberia Shipping', 'LBSH', 'example.com', 'LR'),
      const _CompanySeed('TransAfrica Holdings', 'TAF', 'example.com', 'LR'),
      const _CompanySeed('Monrovia Energy', 'MNE', 'example.com', 'LR'),
    ];

    return List<Stock>.generate(seeds.length, (index) {
      final seed = seeds[index];
      final basePrice = 8 + ((index * 37) % 2800) / 10;
      final changePercent = ((index * 19) % 240 - 120) / 10;
      final isCompliant = index % 3 != 0;
      final stockId = 1000 + index;

      return Stock(
        id: stockId,
        companyName: seed.name,
        tradingSymbol: seed.symbol,
        logo: 'https://logo.clearbit.com/${seed.domain}',
        currency: 'USD',
        shariahCheck: true,
        analysisDate: DateTime.now().subtract(Duration(days: index % 30)),
        isCompliant: isCompliant,
        price: StockPrice(
          price: double.parse(basePrice.toStringAsFixed(2)),
          changePercent: double.parse(changePercent.toStringAsFixed(2)),
        ),
        countryCode: seed.countryCode,
      );
    });
  }
}

class _CompanySeed {
  const _CompanySeed(
    this.name,
    this.symbol,
    this.domain,
    this.countryCode,
  );

  final String name;
  final String symbol;
  final String domain;
  final String countryCode;
}

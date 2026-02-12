import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/stock.dart';
import 'mock_stock_backend.dart';
import 'stock_query.dart';

class StockRepository {
  StockRepository({
    http.Client? client,
    MockStockBackend? mockBackend,
    this.useMockOnly = false,
  }) : _client = client ?? http.Client(),
       _mockBackend = mockBackend ?? MockStockBackend();

  static const String _stocksEndpoint =
      'https://dev.codeunion.kz/ailat/api/stocks/list';

  final http.Client _client;
  final MockStockBackend _mockBackend;
  final bool useMockOnly;

  bool _mockModeLocked = false;

  List<String> get supportedCountries => _mockBackend.supportedCountries;

  Future<StockResponse> fetchStocks(StockQuery query) async {
    if (useMockOnly || _mockModeLocked) {
      return _mockBackend.fetchStocks(query);
    }

    try {
      return await _fetchRemoteStocks(query);
    } catch (_) {
      // Lock to mock mode after the first backend failure so the UX remains fast.
      _mockModeLocked = true;
      return _mockBackend.fetchStocks(query);
    }
  }

  Future<StockResponse> _fetchRemoteStocks(StockQuery query) async {
    final uri = Uri.parse(
      _stocksEndpoint,
    ).replace(queryParameters: _buildQueryParameters(query));

    final response = await _client.get(uri).timeout(const Duration(seconds: 8));

    if (response.statusCode != 200) {
      throw Exception('Unexpected status code: ${response.statusCode}');
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Unexpected response format');
    }

    final rawData = decoded['data'];
    if (rawData is! List<dynamic>) {
      throw const FormatException('Missing data array');
    }

    final meta = decoded['meta'];
    final count = meta is Map<String, dynamic> && meta['count'] is num
        ? (meta['count'] as num).toInt()
        : rawData.length;

    final stocks = rawData
        .whereType<Map<dynamic, dynamic>>()
        .map((item) => Stock.fromJson(Map<String, dynamic>.from(item)))
        .toList();

    return StockResponse(data: stocks, count: count, fromMock: false);
  }

  Map<String, String> _buildQueryParameters(StockQuery query) {
    final params = <String, String>{
      'pagination[page]': '${query.page}',
      'pagination[perPage]': '${query.perPage}',
    };

    final normalizedSearch = query.search.trim();
    if (normalizedSearch.isNotEmpty) {
      params['filters[search]'] = normalizedSearch;
    }
    if (query.compliance != null) {
      params['filters[compliance]'] = '${query.compliance}';
    }
    if (query.countryCode != null && query.countryCode!.isNotEmpty) {
      params['filters[country]'] = query.countryCode!;
    }

    return params;
  }
}

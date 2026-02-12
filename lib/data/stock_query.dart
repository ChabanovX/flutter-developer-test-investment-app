class StockQuery {
  const StockQuery({
    this.compliance,
    this.search = '',
    this.countryCode,
    this.page = 1,
    this.perPage = 20,
  });

  final bool? compliance;
  final String search;
  final String? countryCode;
  final int page;
  final int perPage;

  StockQuery copyWith({
    bool? compliance,
    bool setCompliance = false,
    String? search,
    String? countryCode,
    bool clearCountry = false,
    int? page,
    int? perPage,
  }) {
    return StockQuery(
      compliance: setCompliance ? compliance : this.compliance,
      search: search ?? this.search,
      countryCode: clearCountry ? null : (countryCode ?? this.countryCode),
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }
}

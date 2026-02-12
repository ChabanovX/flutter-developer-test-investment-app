import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_investment_app/stocks/data/models/stock_model.dart';
import 'package:stock_investment_app/stocks/presentation/state/stock_cubit.dart';
import 'package:stock_investment_app/stocks/presentation/ui/widgets/country_selection_popup.dart';
import 'package:stock_investment_app/stocks/presentation/ui/widgets/country_selector_button.dart';
import 'package:stock_investment_app/stocks/presentation/ui/widgets/cupertino_filtering_chip.dart';
import 'package:stock_investment_app/stocks/presentation/ui/widgets/stock_quote_tile.dart';

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  static const Map<String, String> _countryNamesByCode = <String, String>{
    'KZ': 'Kazakhstan',
    'US': 'United States',
    'CA': 'Canada',
    'MX': 'Mexico',
    'DE': 'Germany',
    'FR': 'France',
  };
  static const Map<String, String> _currencyByCountryCode = <String, String>{
    'KZ': 'KZT',
    'US': 'USD',
    'CA': 'CAD',
    'MX': 'MXN',
    'DE': 'EUR',
    'FR': 'EUR',
  };

  final GlobalKey _complianceButtonKey = GlobalKey();
  final Object _complianceTapRegionGroupId = Object();
  final Set<String> _selectedCountryCodes = <String>{};

  OverlayEntry? _complianceEntry;
  ComplianceFilter _selectedComplianceFilter = ComplianceFilter.all;

  String get _countryFilterText {
    if (_selectedCountryCodes.isEmpty) {
      return 'Current Country';
    }

    if (_selectedCountryCodes.length == 1) {
      final String selectedCode = _selectedCountryCodes.first;
      return _countryNamesByCode[selectedCode] ?? selectedCode;
    }

    return '${_selectedCountryCodes.length} Countries';
  }

  String get _complianceText {
    return switch (_selectedComplianceFilter) {
      ComplianceFilter.compliant => 'Compliant',
      ComplianceFilter.nonCompliant => 'Non-compliant',
      ComplianceFilter.all => 'Compliance',
    };
  }

  Future<void> showCountryModalPopup() async {
    _removeComplianceEntry();
    final Set<String>? selectedCountries = await showCupertinoModalPopup<Set<String>>(
      context: context,
      builder: (context) {
        return CountrySelectionPopup(
          initiallySelectedCountryCodes: _selectedCountryCodes,
        );
      },
    );

    if (selectedCountries == null) {
      return;
    }

    setState(() {
      _selectedCountryCodes
        ..clear()
        ..addAll(selectedCountries);
    });
    _applyFilters();
  }

  void _removeComplianceEntry() {
    _complianceEntry?.remove();
    _complianceEntry = null;
  }

  void _onComplianceSelected(ComplianceFilter filter) {
    setState(() {
      _selectedComplianceFilter = filter;
    });
    _removeComplianceEntry();
    _applyFilters();
  }

  Compliance? _mapComplianceToCubit(ComplianceFilter filter) {
    return switch (filter) {
      ComplianceFilter.compliant => Compliance.comnpliant,
      ComplianceFilter.nonCompliant => Compliance.nonCompliant,
      ComplianceFilter.all => null,
    };
  }

  void _applyFilters() {
    String? countryCurrency;
    if (_selectedCountryCodes.length == 1) {
      countryCurrency = _currencyByCountryCode[_selectedCountryCodes.first];
    }

    context.read<StockCubit>().filter(
      FilterOptions(
        filterByCountry: countryCurrency,
        filterByCompliance: _mapComplianceToCubit(_selectedComplianceFilter),
      ),
    );
  }

  void showComplianceEntry() {
    if (_complianceEntry != null) {
      _removeComplianceEntry();
      return;
    }

    final RenderBox? complianceBox = _complianceButtonKey.currentContext?.findRenderObject() as RenderBox?;
    final Rect? buttonRect = complianceBox == null || !complianceBox.hasSize
        ? null
        : complianceBox.localToGlobal(Offset.zero) & complianceBox.size;
    final OverlayState? overlayState = Overlay.maybeOf(context, rootOverlay: true);

    if (buttonRect == null || overlayState == null) {
      return;
    }

    final Size screenSize = MediaQuery.sizeOf(context);
    const double horizontalPagePadding = 12;
    const double topGap = 8;
    const double minOverlayWidth = 300;
    final double overlayWidth = ((buttonRect.width < minOverlayWidth) ? minOverlayWidth : buttonRect.width).clamp(
      0.0,
      screenSize.width - horizontalPagePadding * 2,
    );
    final double overlayLeft = buttonRect.left.clamp(
      horizontalPagePadding,
      screenSize.width - horizontalPagePadding - overlayWidth,
    );
    final double overlayTop = buttonRect.bottom + topGap;

    _complianceEntry = OverlayEntry(
      builder: (context) {
        return Positioned.fill(
          child: Stack(
            children: [
              Positioned(
                left: overlayLeft,
                top: overlayTop,
                width: overlayWidth,
                child: TapRegion(
                  groupId: _complianceTapRegionGroupId,
                  onTapOutside: (_) => _removeComplianceEntry(),
                  child: CupertinoFilteringChip(
                    selectedFilter: _selectedComplianceFilter,
                    onSelected: _onComplianceSelected,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    overlayState.insert(_complianceEntry!);
  }

  @override
  void dispose() {
    _removeComplianceEntry();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: TapRegionSurface(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar.search(
              searchField: CupertinoSearchTextField(
                onChanged: context.read<StockCubit>().search,
              ),
              largeTitle: const Text('Stock Investments'),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 52,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CountrySelectorButton(
                        onTap: showCountryModalPopup,
                        text: _countryFilterText,
                      ),
                      const SizedBox(width: 8),
                      TapRegion(
                        groupId: _complianceTapRegionGroupId,
                        onTapOutside: (_) => _removeComplianceEntry(),
                        child: CountrySelectorButton(
                          key: _complianceButtonKey,
                          onTap: showComplianceEntry,
                          text: _complianceText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<StockCubit, StockState>(
              builder: (context, state) {
                if (state.isLoading && state.filteredStocks == null) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  );
                }

                if (state.error != null) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Text(
                        state.error!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: CupertinoColors.systemRed,
                        ),
                      ),
                    ),
                  );
                }

                final List<StockModel> stocks = state.filteredStocks ?? const <StockModel>[];
                if (stocks.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: Text(
                        'No stocks found',
                        style: TextStyle(
                          fontSize: 18,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ),
                  );
                }

                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final StockModel stock = stocks[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: StockQuoteTile(stock: stock),
                      );
                    }, childCount: stocks.length),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

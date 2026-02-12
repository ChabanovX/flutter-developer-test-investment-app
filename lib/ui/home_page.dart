import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../bloc/stock_bloc.dart';
import '../bloc/stock_event.dart';
import '../bloc/stock_state.dart';
import '../models/stock.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String _allCountriesToken = '__all__';

  late final TextEditingController _searchController;
  late final ScrollController _scrollController;
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController.dispose();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) {
      return;
    }

    final pixels = _scrollController.position.pixels;
    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    if (pixels >= maxScrollExtent - 200) {
      context.read<StockBloc>().add(const StockLoadMoreRequested());
    }
  }

  String _complianceSegmentValue(bool? compliance) {
    if (compliance == true) {
      return 'compliant';
    }
    if (compliance == false) {
      return 'non_compliant';
    }
    return 'all';
  }

  bool? _complianceFromSegment(String? value) {
    switch (value) {
      case 'compliant':
        return true;
      case 'non_compliant':
        return false;
      default:
        return null;
    }
  }

  Future<void> _showCountrySelector(StockState state) async {
    final selectedValue = await showCupertinoModalPopup<String>(
      context: context,
      builder: (popupContext) {
        return CupertinoActionSheet(
          title: const Text('Select Country'),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(popupContext).pop(_allCountriesToken);
              },
              child: const Text('All Countries'),
            ),
            ...state.supportedCountries.map(
              (countryCode) => CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(popupContext).pop(countryCode);
                },
                child: Text(countryCode),
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(popupContext).pop();
            },
            child: const Text('Cancel'),
          ),
        );
      },
    );

    if (!mounted || selectedValue == null) {
      return;
    }

    final countryCode = selectedValue == _allCountriesToken
        ? null
        : selectedValue;
    context.read<StockBloc>().add(StockCountryChanged(countryCode));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: BlocBuilder<StockBloc, StockState>(
          buildWhen: (previous, current) =>
              previous.totalCount != current.totalCount,
          builder: (context, state) {
            return Text('Stock Investment (${state.totalCount})');
          },
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          minimumSize: const Size(28, 28),
          onPressed: () {
            context.read<StockBloc>().add(const StockRefreshRequested());
          },
          child: const Icon(CupertinoIcons.refresh, size: 20),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
              child: CupertinoSearchTextField(
                controller: _searchController,
                onChanged: (value) {
                  _searchDebounce?.cancel();
                  _searchDebounce = Timer(
                    const Duration(milliseconds: 350),
                    () => context.read<StockBloc>().add(
                      StockSearchChanged(value),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: BlocBuilder<StockBloc, StockState>(
                buildWhen: (previous, current) =>
                    previous.compliance != current.compliance ||
                    previous.countryCode != current.countryCode ||
                    previous.supportedCountries != current.supportedCountries,
                builder: (context, state) {
                  final selectedCountry = state.countryCode ?? 'All Countries';

                  return Column(
                    children: <Widget>[
                      CupertinoSlidingSegmentedControl<String>(
                        groupValue: _complianceSegmentValue(state.compliance),
                        children: const <String, Widget>{
                          'all': Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 6,
                            ),
                            child: Text('All'),
                          ),
                          'compliant': Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 6,
                            ),
                            child: Text('Compliant'),
                          ),
                          'non_compliant': Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 6,
                            ),
                            child: Text('Non-compliant'),
                          ),
                        },
                        onValueChanged: (value) {
                          context.read<StockBloc>().add(
                            StockComplianceChanged(
                              _complianceFromSegment(value),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: CupertinoButton(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          color: CupertinoColors.secondarySystemFill,
                          borderRadius: BorderRadius.circular(10),
                          onPressed: () {
                            _showCountrySelector(state);
                          },
                          child: Row(
                            children: <Widget>[
                              const Icon(
                                CupertinoIcons.flag,
                                size: 18,
                                color: CupertinoColors.label,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  selectedCountry,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: CupertinoColors.label,
                                  ),
                                ),
                              ),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 16,
                                color: CupertinoColors.systemGrey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<StockBloc, StockState>(
                builder: (context, state) {
                  if (state.status == StockStatus.loading) {
                    return const _StocksLoadingView();
                  }

                  if (state.status == StockStatus.failure &&
                      state.stocks.isEmpty) {
                    return _FailureView(
                      onRetry: () {
                        context.read<StockBloc>().add(
                          const StockRefreshRequested(),
                        );
                      },
                    );
                  }

                  if (state.stocks.isEmpty) {
                    return Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        child: Column(
                          spacing: 32,
                          children: [
                            Icon(
                              CupertinoIcons.search,
                              size: 54,
                              color: CupertinoColors.systemGrey,
                            ),
                            Text(
                              'No stocks found for selected filters.',
                              style: TextStyle().copyWith(
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                            CupertinoButton(
                              color: CupertinoColors.systemGrey5,
                              child: Text(
                                'Suggest Adding',
                                style: const TextStyle().copyWith(
                                  color: CupertinoColors.black,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${state.totalCount} stocks found',
                            style: const TextStyle(
                              fontSize: 13,
                              color: CupertinoColors.secondaryLabel,
                            ),
                          ),
                        ),
                      ),
                      if (state.errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                          child: Row(
                            children: <Widget>[
                              const Icon(
                                CupertinoIcons.exclamationmark_triangle_fill,
                                color: CupertinoColors.systemRed,
                                size: 16,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  state.errorMessage!,
                                  style: const TextStyle(
                                    color: CupertinoColors.systemRed,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Expanded(
                        child: ListView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics(),
                          ),
                          itemCount:
                              state.stocks.length +
                              (state.isLoadingMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index >= state.stocks.length) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 4),
                                child: _LoadingMoreSkeleton(),
                              );
                            }

                            return _StockCard(stock: state.stocks[index]);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StocksLoadingView extends StatelessWidget {
  const _StocksLoadingView();

  @override
  Widget build(BuildContext context) {
    return _CupertinoSkeletonShimmer(
      child: ListView.separated(
        itemCount: 8,
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, __) => const _StockCardSkeleton(),
      ),
    );
  }
}

class _LoadingMoreSkeleton extends StatelessWidget {
  const _LoadingMoreSkeleton();

  @override
  Widget build(BuildContext context) {
    return const _CupertinoSkeletonShimmer(child: _StockCardSkeleton());
  }
}

class _CupertinoSkeletonShimmer extends StatelessWidget {
  const _CupertinoSkeletonShimmer({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final baseColor = CupertinoColors.systemGrey5.resolveFrom(context);
    final highlightColor = CupertinoColors.systemGrey6.resolveFrom(context);

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: child,
    );
  }
}

class _StockCardSkeleton extends StatelessWidget {
  const _StockCardSkeleton();

  @override
  Widget build(BuildContext context) {
    final borderColor = CupertinoColors.separator
        .resolveFrom(context)
        .withValues(alpha: 0.16);
    final backgroundColor = CupertinoColors.secondarySystemGroupedBackground
        .resolveFrom(context);

    return Container(
      height: 86,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor, width: 0.4),
      ),
      padding: const EdgeInsets.all(12),
      child: const Row(
        children: <Widget>[
          _SkeletonBlock.circular(size: 44),
          SizedBox(width: 12),
          Expanded(child: _StockInfoSkeleton()),
          SizedBox(width: 10),
          _PriceInfoSkeleton(),
        ],
      ),
    );
  }
}

class _StockInfoSkeleton extends StatelessWidget {
  const _StockInfoSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            _SkeletonBlock(width: 64, height: 14),
            SizedBox(width: 6),
            _SkeletonBlock.circular(size: 20),
          ],
        ),
        SizedBox(height: 8),
        _SkeletonBlock(width: 126, height: 12),
      ],
    );
  }
}

class _PriceInfoSkeleton extends StatelessWidget {
  const _PriceInfoSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        _SkeletonBlock(width: 78, height: 14),
        SizedBox(height: 6),
        _SkeletonBlock(width: 52, height: 11),
      ],
    );
  }
}

class _SkeletonBlock extends StatelessWidget {
  const _SkeletonBlock({required this.width, required this.height})
    : isCircular = false;

  const _SkeletonBlock.circular({required double size})
    : width = size,
      height = size,
      isCircular = true;

  final double width;
  final double height;
  final bool isCircular;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(isCircular ? 999 : 8),
      ),
    );
  }
}

class _FailureView extends StatelessWidget {
  const _FailureView({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Failed to load stocks.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            CupertinoButton.filled(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class _StockCard extends StatelessWidget {
  const _StockCard({required this.stock});

  final Stock stock;

  @override
  Widget build(BuildContext context) {
    final isPositive = stock.price.changePercent >= 0;
    final changeColor = isPositive
        ? CupertinoColors.systemGreen
        : CupertinoColors.systemRed;
    final changePrefix = isPositive ? '+' : '';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: CupertinoColors.secondarySystemGroupedBackground.resolveFrom(
          context,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: CachedNetworkImage(
                imageUrl: stock.logo,
                width: 44,
                height: 44,
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => Container(
                  width: 44,
                  height: 44,
                  color: CupertinoColors.systemGrey5,
                  alignment: Alignment.center,
                  child: const Icon(
                    CupertinoIcons.building_2_fill,
                    color: CupertinoColors.systemGrey,
                    size: 20,
                  ),
                ),
                placeholder: (_, __) => Container(
                  width: 44,
                  height: 44,
                  color: CupertinoColors.systemGrey5,
                  alignment: Alignment.center,
                  child: const CupertinoActivityIndicator(radius: 9),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        stock.tradingSymbol,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: stock.isCompliant
                              ? CupertinoColors.systemGreen
                              : CupertinoColors.systemRed,
                        ),
                        child: Icon(
                          stock.isCompliant
                              ? CupertinoIcons.check_mark
                              : CupertinoIcons.xmark,
                          color: CupertinoColors.white,
                          size: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    stock.companyName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: CupertinoColors.label.resolveFrom(context),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '${stock.price.price.toStringAsFixed(2)} ${stock.currency}',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 3),
                Text(
                  '$changePrefix${stock.price.changePercent.toStringAsFixed(2)}%',
                  style: TextStyle(
                    color: changeColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocListener<StockBloc, StockState>(
      listenWhen: (previous, current) =>
          previous.errorMessage != current.errorMessage &&
          current.errorMessage != null &&
          current.stocks.isNotEmpty,
      listener: (context, state) {
        final messenger = ScaffoldMessenger.of(context);
        messenger
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(state.errorMessage!)));
      },
      child: Material(
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: BlocBuilder<StockBloc, StockState>(
              buildWhen: (previous, current) =>
                  previous.totalCount != current.totalCount,
              builder: (context, state) {
                return Text(
                  'Stock Investment (${state.totalCount})',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 90),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const CupertinoSearchTextField(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search by company or symbol',
                    border: OutlineInputBorder(),
                  ),
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
                    final selectedCountry =
                        state.supportedCountries.contains(state.countryCode)
                        ? state.countryCode
                        : null;

                    return Row(
                      children: <Widget>[
                        Expanded(
                          child: DropdownButtonFormField<bool?>(
                            initialValue: state.compliance,
                            decoration: const InputDecoration(
                              labelText: 'Compliance',
                              border: OutlineInputBorder(),
                              isDense: true,
                            ),
                            items: const <DropdownMenuItem<bool?>>[
                              DropdownMenuItem<bool?>(
                                value: null,
                                child: Text('All'),
                              ),
                              DropdownMenuItem<bool?>(
                                value: true,
                                child: Text('Compliant'),
                              ),
                              DropdownMenuItem<bool?>(
                                value: false,
                                child: Text('Non-compliant'),
                              ),
                            ],
                            onChanged: (value) {
                              context.read<StockBloc>().add(
                                StockComplianceChanged(value),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: DropdownButtonFormField<String?>(
                            initialValue: selectedCountry,
                            decoration: const InputDecoration(
                              labelText: 'Country',
                              border: OutlineInputBorder(),
                              isDense: true,
                            ),
                            items: <DropdownMenuItem<String?>>[
                              const DropdownMenuItem<String?>(
                                value: null,
                                child: Text('All'),
                              ),
                              ...state.supportedCountries.map(
                                (countryCode) => DropdownMenuItem<String?>(
                                  value: countryCode,
                                  child: Text(countryCode),
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              context.read<StockBloc>().add(
                                StockCountryChanged(value),
                              );
                            },
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
                    if (state.isInitialLoading) {
                      return const _StocksLoadingView();
                    }

                    if (state.status == StockStatus.failure &&
                        state.stocks.isEmpty) {
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
                              FilledButton(
                                onPressed: () {
                                  context.read<StockBloc>().add(
                                    const StockRefreshRequested(),
                                  );
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    if (state.stocks.isEmpty) {
                      return const Center(
                        child: Text('No stocks found for selected filters.'),
                      );
                    }

                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<StockBloc>().add(
                          const StockRefreshRequested(),
                        );
                      },
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        itemCount:
                            state.stocks.length + (state.isLoadingMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index >= state.stocks.length) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Center(
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                            );
                          }

                          final stock = state.stocks[index];
                          return _StockCard(stock: stock);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StocksLoadingView extends StatelessWidget {
  const _StocksLoadingView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      itemBuilder: (_, __) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 84,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _StockCard extends StatelessWidget {
  const _StockCard({required this.stock});

  final Stock stock;

  @override
  Widget build(BuildContext context) {
    final isPositive = stock.price.changePercent >= 0;
    final changeColor = isPositive ? Colors.green : Colors.red;
    final changePrefix = isPositive ? '+' : '';

    return DefaultTextStyle(
      style: CupertinoTheme.of(context).textTheme.textStyle,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl: stock.logo,
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                  errorWidget: (_, __, ___) => Container(
                    width: 44,
                    height: 44,
                    color: Colors.blueGrey.shade50,
                    child: const Icon(Icons.business),
                  ),
                  placeholder: (_, __) => Container(
                    width: 44,
                    height: 44,
                    alignment: Alignment.center,
                    color: Colors.blueGrey.shade50,
                    child: const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            stock.tradingSymbol,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 4),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: stock.isCompliant
                                  ? Colors.green
                                  : Colors.red,
                            ),
                            child: Icon(
                              color: Colors.white,
                              stock.isCompliant ? Icons.check : Icons.close,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      stock.companyName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
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
                    '${stock.price.price.toStringAsFixed(2)} ${stock.currency} ',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$changePrefix${stock.price.changePercent.toStringAsFixed(2)}%',
                    style: TextStyle(
                      color: changeColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 14
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ComplianceChip extends StatelessWidget {
  const _ComplianceChip({required this.isCompliant});

  final bool isCompliant;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isCompliant ? Colors.green.shade50 : Colors.red.shade50,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        isCompliant ? 'Compliant' : 'Non-compliant',
        style: TextStyle(
          color: isCompliant ? Colors.green.shade800 : Colors.red.shade800,
          fontWeight: FontWeight.w600,
          fontSize: 11,
        ),
      ),
    );
  }
}

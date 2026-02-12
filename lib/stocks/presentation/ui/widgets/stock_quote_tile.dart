import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:stock_investment_app/stocks/data/models/stock_model.dart';

class StockQuoteTile extends StatelessWidget {
  const StockQuoteTile({
    required this.stock,
    super.key,
  });

  final StockModel stock;

  @override
  Widget build(BuildContext context) {
    final double changePercent = stock.price.changePercent;
    final bool isPositive = changePercent > 0;
    final bool isNegative = changePercent < 0;
    final String signedChange = '${isPositive ? '+' : ''}${changePercent.toStringAsFixed(2)}%';
    final Color changeColor = isNegative
        ? const Color(0xFFE33E73)
        : isPositive
        ? CupertinoColors.activeGreen
        : CupertinoColors.systemGrey;

    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: <Widget>[
          _LogoAvatar(logoUrl: stock.logo, companyName: stock.companyName),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        stock.tradingSymbol,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    if (stock.shariahCheck) ...<Widget>[
                      const SizedBox(width: 8),
                      _ComplianceBadge(isCompliant: stock.isCompliant),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  stock.companyName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF727377),
                    letterSpacing: -0.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '${stock.price.price.toStringAsFixed(2)} ${stock.currency}',
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: CupertinoColors.black,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                signedChange,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: changeColor,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LogoAvatar extends StatelessWidget {
  const _LogoAvatar({
    required this.logoUrl,
    required this.companyName,
  });

  final String logoUrl;
  final String companyName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CachedNetworkImage(
        imageUrl: logoUrl,
        fit: BoxFit.contain,
        placeholder: (context, url) {
          return const CupertinoActivityIndicator();
        },
        errorWidget: (context, url, error) {
          return Center(
            child: Text(
              companyName.characters.first.toUpperCase(),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Color(0xFF7A7B7E),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ComplianceBadge extends StatelessWidget {
  const _ComplianceBadge({
    required this.isCompliant,
  });

  final bool isCompliant;

  @override
  Widget build(BuildContext context) {
    return Icon(
      isCompliant ? CupertinoIcons.checkmark_seal_fill : CupertinoIcons.xmark_seal_fill,
      size: 20,
      color: isCompliant ? const Color(0xFF8CC63F) : CupertinoColors.systemRed,
    );
  }
}

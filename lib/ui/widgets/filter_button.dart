import 'package:flutter/cupertino.dart';

class FilterButton<T> extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.name,
    required this.sheetBuilder,
    this.icon,
    this.onSelected,
    this.maxLabelWidth = 180,
  });

  final String name;
  final IconData? icon;
  final WidgetBuilder sheetBuilder;
  final ValueChanged<T?>? onSelected;
  final double maxLabelWidth;

  Future<void> _handleTap(BuildContext context) async {
    final selectedValue = await showCupertinoModalPopup<T>(
      context: context,
      builder: sheetBuilder,
    );
    onSelected?.call(selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: CupertinoColors.secondarySystemFill,
      borderRadius: BorderRadius.circular(10),
      onPressed: () => _handleTap(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (icon != null) ...<Widget>[
            Icon(icon, size: 18, color: CupertinoColors.label),
            const SizedBox(width: 8),
          ],
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxLabelWidth),
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: CupertinoColors.label),
            ),
          ),
          const SizedBox(width: 6),
          const Icon(
            CupertinoIcons.chevron_down,
            size: 16,
            color: CupertinoColors.systemGrey,
          ),
        ],
      ),
    );
  }
}

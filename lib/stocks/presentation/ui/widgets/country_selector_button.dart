import 'package:flutter/cupertino.dart';

class CountrySelectorButton extends StatelessWidget {
  const CountrySelectorButton({
    required this.onTap,
    required this.text,
    super.key,
    this.icon,
  });

  final Icon? icon;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        border: Border.all(
          color: CupertinoColors.systemGrey4,
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              SizedBox(
                width: 52,
                height: 52,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: CupertinoColors.systemGrey5,
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: icon),
                ),
              ),
              const SizedBox(width: 16),
            ],
            Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: CupertinoColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 12),
            const Icon(
              CupertinoIcons.chevron_down,
              color: CupertinoColors.systemGrey,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

enum ComplianceFilter {
  compliant,
  nonCompliant,
  all,
}

class CupertinoFilteringChip extends StatelessWidget {
  const CupertinoFilteringChip({
    required this.selectedFilter,
    required this.onSelected,
    super.key,
  });

  final ComplianceFilter selectedFilter;
  final ValueChanged<ComplianceFilter> onSelected;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFD6D6D8)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _FilterOptionTile(
              label: 'Compliant',
              isSelected: selectedFilter == ComplianceFilter.compliant,
              trailingIcon: CupertinoIcons.checkmark_seal,
              onTap: () => onSelected(ComplianceFilter.compliant),
              showDivider: true,
            ),
            _FilterOptionTile(
              label: 'Non-compliant',
              isSelected: selectedFilter == ComplianceFilter.nonCompliant,
              trailingIcon: CupertinoIcons.minus_circle,
              onTap: () => onSelected(ComplianceFilter.nonCompliant),
              showDivider: true,
            ),
            _FilterOptionTile(
              label: 'All',
              isSelected: selectedFilter == ComplianceFilter.all,
              onTap: () => onSelected(ComplianceFilter.all),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterOptionTile extends StatelessWidget {
  const _FilterOptionTile({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.trailingIcon,
    this.showDivider = false,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData? trailingIcon;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: showDivider
            ? const Border(
                bottom: BorderSide(
                  color: Color(0xFFD0D0D2),
                ),
              )
            : null,
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: SizedBox(
          height: 88,
          child: Row(
            children: [
              const SizedBox(width: 16),
              SizedBox(
                width: 28,
                child: isSelected
                    ? const Icon(
                        CupertinoIcons.check_mark,
                        color: CupertinoColors.black,
                        size: 24,
                      )
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (trailingIcon != null) ...[
                Icon(
                  trailingIcon,
                  size: 34,
                  color: CupertinoColors.black,
                ),
                const SizedBox(width: 16),
              ] else
                const SizedBox(width: 50),
            ],
          ),
        ),
      ),
    );
  }
}

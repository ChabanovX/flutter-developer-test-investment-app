import 'package:flutter/cupertino.dart';

class CountrySelectionPopup extends StatefulWidget {
  const CountrySelectionPopup({
    required this.initiallySelectedCountryCodes,
    super.key,
  });

  final Set<String> initiallySelectedCountryCodes;

  @override
  State<CountrySelectionPopup> createState() => _CountrySelectionPopupState();
}

class _CountrySelectionPopupState extends State<CountrySelectionPopup> {
  static const List<String> _sectionOrder = <String>[
    'Local',
    'North America',
    'Europe',
  ];

  static const List<_CountryOption> _countryOptions = <_CountryOption>[
    _CountryOption(code: 'KZ', name: 'Kazakhstan', section: 'Local'),
    _CountryOption(code: 'US', name: 'United States', section: 'North America'),
    _CountryOption(code: 'CA', name: 'Canada', section: 'North America'),
    _CountryOption(code: 'MX', name: 'Mexico', section: 'North America'),
    _CountryOption(code: 'DE', name: 'Germany', section: 'Europe'),
    _CountryOption(code: 'FR', name: 'France', section: 'Europe'),
  ];

  late final TextEditingController _searchController;
  late Set<String> _selectedCountryCodes;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _selectedCountryCodes = Set<String>.from(widget.initiallySelectedCountryCodes);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query.trim().toLowerCase();
    });
  }

  void _onCountryTapped(String countryCode) {
    setState(() {
      if (_selectedCountryCodes.contains(countryCode)) {
        _selectedCountryCodes.remove(countryCode);
      } else {
        _selectedCountryCodes.add(countryCode);
      }
    });
  }

  void _closePopup() {
    Navigator.of(context).pop(_selectedCountryCodes);
  }

  List<_CountryOption> get _filteredCountries {
    if (_searchQuery.isEmpty) {
      return _countryOptions;
    }

    return _countryOptions
        .where((country) {
          return country.name.toLowerCase().contains(_searchQuery);
        })
        .toList(growable: false);
  }

  Map<String, List<_CountryOption>> get _countriesBySection {
    final Map<String, List<_CountryOption>> grouped = <String, List<_CountryOption>>{};

    for (final _CountryOption country in _filteredCountries) {
      grouped.putIfAbsent(country.section, () => <_CountryOption>[]).add(country);
    }

    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, List<_CountryOption>> countriesBySection = _countriesBySection;
    final List<Widget> sectionWidgets = <Widget>[];

    for (final String section in _sectionOrder) {
      final List<_CountryOption> sectionCountries = countriesBySection[section] ?? <_CountryOption>[];
      if (sectionCountries.isEmpty) {
        continue;
      }

      if (sectionWidgets.isNotEmpty) {
        sectionWidgets.add(const SizedBox(height: 18));
      }

      sectionWidgets.addAll(
        <Widget>[
          Text(
            section,
            style: const TextStyle(
              color: Color(0xFF8B8B8E),
              fontSize: 28,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 10),
        ],
      );
      for (final _CountryOption country in sectionCountries) {
        sectionWidgets.add(
          _CountryOptionTile(
            country: country,
            isSelected: _selectedCountryCodes.contains(country.code),
            onTap: () => _onCountryTapped(country.code),
          ),
        );
      }
    }

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
        child: CupertinoPopupSurface(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.83,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Expanded(
                        child: Text(
                          'Countries',
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                      CupertinoButton(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        onPressed: _closePopup,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFE8E8EA),
                          ),
                          child: const Icon(
                            CupertinoIcons.xmark,
                            size: 18,
                            color: Color(0xFF8C8C90),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  CupertinoSearchTextField(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                  ),
                  const SizedBox(height: 18),
                  Expanded(
                    child: sectionWidgets.isEmpty
                        ? const Center(
                            child: Text(
                              'No countries found',
                              style: TextStyle(
                                color: CupertinoColors.systemGrey,
                                fontSize: 18,
                              ),
                            ),
                          )
                        : ListView(
                            children: sectionWidgets,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CountryOptionTile extends StatelessWidget {
  const _CountryOptionTile({
    required this.country,
    required this.isSelected,
    required this.onTap,
  });

  final _CountryOption country;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: SizedBox(
        height: 62,
        child: Row(
          children: <Widget>[
            _CountryFlagAvatar(countryCode: country.code),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                country.name,
                style: const TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                ),
              ),
            ),
            _CountrySelectionChip(isSelected: isSelected),
          ],
        ),
      ),
    );
  }
}

class _CountryFlagAvatar extends StatelessWidget {
  const _CountryFlagAvatar({
    required this.countryCode,
  });

  final String countryCode;

  String _countryFlagEmoji(String code) {
    final String upperCode = code.toUpperCase();
    final int firstLetter = upperCode.codeUnitAt(0) - 65 + 0x1F1E6;
    final int secondLetter = upperCode.codeUnitAt(1) - 65 + 0x1F1E6;
    return String.fromCharCodes(<int>[firstLetter, secondLetter]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFFE2E2E4),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        _countryFlagEmoji(countryCode),
        style: const TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }
}

class _CountrySelectionChip extends StatelessWidget {
  const _CountrySelectionChip({
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final Color borderColor = isSelected ? const Color(0xFFF3BF3D) : const Color(0xFFE0E0E2);
    final Color backgroundColor = isSelected ? const Color(0xFFF3BF3D) : CupertinoColors.white;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
        ),
        color: backgroundColor,
      ),
      alignment: Alignment.center,
      child: isSelected
          ? const Icon(
              CupertinoIcons.check_mark,
              color: CupertinoColors.white,
              size: 18,
            )
          : null,
    );
  }
}

class _CountryOption {
  const _CountryOption({
    required this.code,
    required this.name,
    required this.section,
  });

  final String code;
  final String name;
  final String section;
}

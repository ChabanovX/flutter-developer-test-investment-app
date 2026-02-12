import 'package:flutter/material.dart';
import 'package:stock_investment_app/core/theme/theme.dart';

extension BuildContextX on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
}

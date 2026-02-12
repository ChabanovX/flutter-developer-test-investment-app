// generator's job.
// ignore_for_file: annotate_overrides

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'theme.tailor.dart';

@TailorMixin()
class AppTheme extends ThemeExtension<AppTheme> with _$AppThemeTailorMixin {
  const AppTheme({
    required this.bg,
    required this.grey,
  });

  factory AppTheme.light() {
    return const AppTheme(
      bg: CupertinoColors.white,
      grey: Color.fromARGB(255, 240, 240, 240),
    );
  }

  // final fields here
  final Color bg;
  final Color grey;
}

import 'package:flutter/material.dart';
import 'package:flutter_labs/core/themes/app_divider_theme.dart';
import 'package:flutter_labs/core/themes/app_input_theme.dart';

class AppTheme {
  static ThemeData initTheme() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.indigo,
      brightness: Brightness.dark,
    );

    return ThemeData(
      colorScheme: colorScheme,
      inputDecorationTheme: AppInputTheme.initInput(colorScheme),
      dividerTheme: AppDividerTheme.initDivider(colorScheme),
    );
  }
}
import 'package:flutter/material.dart';

class AppDividerTheme {
  static DividerThemeData initDivider(ColorScheme cs) {
    return DividerThemeData(
      thickness: 3,
      color: cs.primary,
      radius: BorderRadius.all(Radius.circular(10)),
    );
  }
}
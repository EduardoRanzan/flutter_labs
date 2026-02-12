import 'package:flutter/material.dart';

class AppCardTheme {
  static CardThemeData initCard(ColorScheme cs) {
    return CardThemeData(
      elevation: 5,
      color: cs.primaryContainer
    );
  }
}
import 'package:flutter/material.dart';

class AppIconTheme {
  static IconThemeData initIcon(ColorScheme cs) {
    return IconThemeData(
      shadows: [
        Shadow(
          offset: Offset(0, 1),
          blurRadius: 1,
        ),
        Shadow(
          offset: Offset(0, 1),
          blurRadius: 2,
        ),
      ],
    );
  }
}
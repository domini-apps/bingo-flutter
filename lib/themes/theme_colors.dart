import 'package:flutter/material.dart';

class ThemeColors {
  static const Color primary = Color.fromRGBO(92, 230, 156, 1);
  static const Color primaryVariant = Color.fromRGBO(45, 182, 108, 1);
  static const Color secondary = Color.fromRGBO(128, 86, 45, 1);
  static const Color onPrimary = Color.fromRGBO(128, 86, 45, 1);
  static const Color onSecondary = Color.fromRGBO(255, 249, 243, 1);

  static MaterialColor getMaterialColor(Color color) {
    Map<int, Color> swatch = {};
    for (int i = 1; i <= 10; i++) {
      swatch[i * 100] = color.withOpacity(i / 10);
    }
    return MaterialColor(color.value, swatch);
  }
}


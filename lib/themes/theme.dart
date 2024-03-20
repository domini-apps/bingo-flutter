import 'package:flutter/material.dart';
import 'package:bingo_flutter/themes/theme_colors.dart';

ThemeData appTheme = ThemeData(
  primarySwatch: ThemeColors.getMaterialColor(ThemeColors.primary),
  primaryColor: ThemeColors.getMaterialColor(ThemeColors.primary),
  brightness: Brightness.dark,
  textTheme: const TextTheme(),
);

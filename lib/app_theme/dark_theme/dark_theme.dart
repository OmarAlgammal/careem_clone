

import 'package:careem_clone/app_theme/dark_theme/dark_theme_colors.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

ThemeData appDarkTheme = ThemeData.dark().copyWith(
  primaryColor: DarkThemeColors.primaryColor,
  colorScheme: const ColorScheme.light().copyWith(
    primary: DarkThemeColors.primaryColor,
  ),
);
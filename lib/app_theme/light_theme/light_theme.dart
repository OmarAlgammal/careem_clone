import 'package:careem_clone/app_theme/light_theme/light_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData appLightTheme = ThemeData.light().copyWith(
  textTheme: ThemeData.light().textTheme.copyWith(
    labelLarge: TextStyle(
      fontSize: 15.sp,
      color: ThemeData.light().colorScheme.onSurface,
    ),
    titleLarge: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
    ),
  ),
  primaryColor: LightThemeColors.primaryColor,
  cardColor: LightThemeColors.cardColor,
  colorScheme: const ColorScheme.light().copyWith(
    primary: LightThemeColors.primaryColor,
  ),
);

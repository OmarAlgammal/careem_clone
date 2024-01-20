import 'package:careem_clone/app_theme/light_theme/light_theme.dart';
import 'package:careem_clone/constants/padding.dart';
import 'package:flutter/material.dart';

void showSnackBar(
    {required BuildContext context,
    required Widget content,
    Color? backgroundColor,
    int? duration}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: content,
      backgroundColor: backgroundColor ?? appLightTheme.colorScheme.error,
      padding: padding8,
      duration: Duration(seconds: duration ?? 3),
    ),
  );
}

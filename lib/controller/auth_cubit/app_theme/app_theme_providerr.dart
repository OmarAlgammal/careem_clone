import 'package:careem_clone/app_theme/dark_theme/dark_theme.dart';
import 'package:careem_clone/app_theme/light_theme/light_theme.dart';
import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  AppThemeProvider();

  bool _isDark = false;

  ThemeData get appTheme => _isDark ? appDarkTheme : appLightTheme;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

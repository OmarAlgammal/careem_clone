import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/color_scheme.dart';
import 'package:flutter/src/material/text_theme.dart';
import 'package:flutter/src/material/theme_data.dart';

import '../../../controller/auth_cubit/app_theme/app_theme_providerr.dart';
import '../../../service_locator/service_locator.dart';

extension ContextExtension on BuildContext {
  ThemeData get appTheme => locator<AppThemeProvider>().appTheme;
  TextTheme get textTheme => locator<AppThemeProvider>().appTheme.textTheme;
  ColorScheme get colorScheme => locator<AppThemeProvider>().appTheme.colorScheme;


}

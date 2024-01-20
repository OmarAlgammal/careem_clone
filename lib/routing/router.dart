import 'package:careem_clone/helpers/timer_notifier.dart';
import 'package:careem_clone/routing/routes.dart';
import 'package:careem_clone/service_locator/service_locator.dart';
import 'package:careem_clone/views/screens/landing_screen/landing_screen/landing_screen.dart';
import 'package:careem_clone/views/screens/otp_screen/otp_screen/otp_screen.dart';
import 'package:flutter/cupertino.dart';

import '../views/screens/home_screen/home_screen/home_screen.dart';
import '../views/screens/login_screen/login_screen_mobile/login_screen_mobile.dart';

Map<String, Widget> routes = {
  AppRoutes.homeScreen: const HomeScreen(),
  AppRoutes.landingScreen: const LandingScreen(),

  /// TODO: Refactor this parameter (TextEditingController)
  AppRoutes.loginScreen: LoginScreenMobile(TextEditingController()),

  /// TODO: Refactor parameters in OptScreen class
  AppRoutes.otpScreen:
      OtpScreen(locator<TimerNotifier>(), TextEditingController()),
};

Route onGenerate(RouteSettings settings) {
  return CupertinoPageRoute(
    settings: settings,
    builder: (context) => routes[settings.name] ?? const LandingScreen(),
  );
}

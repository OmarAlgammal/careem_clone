import 'package:flutter/material.dart';

import '../../login_screen/login_screen_mobile/login_screen_mobile.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///TODO: Refactor this parameter (TextEditingController)
    return LoginScreenMobile(TextEditingController());
  }
}

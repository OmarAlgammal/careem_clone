import 'package:careem_clone/controller/auth_cubit/login_cubit.dart';
import 'package:careem_clone/services/auth_services/auth_services.dart';
import 'package:careem_clone/views/screens/home_screen/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../login_screen/login_screen/login_screen.dart';

class LandingScreenMobile extends StatelessWidget {
  const LandingScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: LoginCubit(AuthServices()).authStateChanges(),
      builder: (context, state) {
        if ([ConnectionState.active, ConnectionState.done]
            .contains(state.connectionState)) {
          if (state.data != null) {
            return const HomeScreen();
          }
          return const LoginScreen();
        }
        return const LoginScreen();
      },
    );
  }
}

import 'package:careem_clone/controller/auth_cubit/app_theme/app_theme_providerr.dart';
import 'package:careem_clone/controller/auth_cubit/login_cubit.dart';
import 'package:careem_clone/firebase_options.dart';
import 'package:careem_clone/routing/routes.dart';
import 'package:careem_clone/service_locator/service_locator.dart';
import 'package:careem_clone/services/auth_services/auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'routing/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AppThemeProvider>(
      create: (context) => locator<AppThemeProvider>(),
      child: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(AuthServices()),
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) =>
              MaterialApp(
                debugShowCheckedModeBanner: false,
                onGenerateRoute: onGenerate,
                initialRoute: AppRoutes.homeScreen,
                theme: locator<AppThemeProvider>().appTheme,
              ),
        ),
      ),
    );
  }
}

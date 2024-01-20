import 'package:careem_clone/controller/auth_cubit/auth_states/auth_states.dart';
import 'package:careem_clone/controller/auth_cubit/login_cubit.dart';
import 'package:careem_clone/routing/routes.dart';
import 'package:careem_clone/utils/extensions/extensions/theme_extension.dart';
import 'package:careem_clone/views/widgets/careem_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../constants/border.dart';
import '../../../../constants/gaps.dart';
import '../../../../constants/images.dart';
import '../../../../constants/padding.dart';
import 'component/app_logo_login_screen_comp.dart';
import 'component/login_button_login_screen_comp.dart';
import 'component/mobile_input_field_login_screen_comp.dart';
import 'component/screen_description_login_screen_comp.dart';

class LoginScreenMobile extends StatefulWidget {
  @override
  State<LoginScreenMobile> createState() => _LoginScreenMobileState();

  final TextEditingController _textEditingController;

  const LoginScreenMobile(this._textEditingController);
}

class _LoginScreenMobileState extends State<LoginScreenMobile>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (WidgetsBinding.instance.lifecycleState ==
                  AppLifecycleState.resumed &&
              state is PhoneNumberHasBeenVerified) {
            Navigator.popAndPushNamed(context, AppRoutes.otpScreen,
                arguments: MobileInputFieldLoginScreenComp.phoneNumber);
          }
        },
        child: Padding(
          padding: padding16,
          child: Column(
            children: [
              const AppLogoLoginScreenComp(),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScreenDescriptionLoginScreenComp(),
                    gap24,
                    MobileInputFieldLoginScreenComp(widget._textEditingController),
                    gap12,
                    LoginButtonLoginScreenComp(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

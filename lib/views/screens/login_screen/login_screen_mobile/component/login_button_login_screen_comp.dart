import 'package:careem_clone/views/widgets/careem_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../controller/auth_cubit/auth_states/auth_states.dart';
import '../../../../../controller/auth_cubit/login_cubit.dart';
import '../../../../widgets/careem_elevated_button.dart';
import 'mobile_input_field_login_screen_comp.dart';

class LoginButtonLoginScreenComp extends StatelessWidget {
  const LoginButtonLoginScreenComp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is InvalidPhoneNumber) {
          /// TODO: Show alert dialog
        }
      },
      builder: (context, state) {
        return CareemTextButton(
            loadingState: state is VerifyingMobileNumber,
            onPressed: () {
              if (MobileInputFieldLoginScreenComp.phoneNumber != null) {
                LoginCubit.instance(context).signInWithMobileNumber(
                  mobileNumber: MobileInputFieldLoginScreenComp.phoneNumber!,
                );
              }

              /// TODO: Show dialog tell user he should enter a phone number
            },
            text: 'Continue');
      },
    );
  }
}

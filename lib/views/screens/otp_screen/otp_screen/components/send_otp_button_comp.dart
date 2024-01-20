import 'package:careem_clone/helpers/timer_notifier.dart';
import 'package:careem_clone/views/screens/otp_screen/otp_screen/components/otp_text_field_com.dart';
import 'package:careem_clone/views/widgets/careem_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../controller/auth_cubit/auth_states/auth_states.dart';
import '../../../../../controller/auth_cubit/login_cubit.dart';
import '../../../../../routing/routes.dart';
import '../../../../../utils/extensions/functions/snackbar.dart';
import '../../../../widgets/careem_elevated_button.dart';

class SendOtpButtonComp extends StatelessWidget {
  const SendOtpButtonComp(
      {super.key, required this.timerNotifier, required this.pinController});

  final TimerNotifier timerNotifier;
  final TextEditingController pinController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is UserLoggedInSuccessfully) {
          Navigator.popAndPushNamed(
            context,
            AppRoutes.homeScreen,
          );
        }
        if (state is LoginErrorState) {
          showSnackBar(
            context: context,
            content: Text(state.message),
          );
        }
      },
      builder: (context, state) {
        return CareemTextButton(
          onPressed: () {
            timerNotifier.startTimer();
            if (pinController.value.text.trim().length == 6) {
              LoginCubit.instance(context)
                  .submitOTP(otpCode: OtpTextFieldComp.otpCode);
            }
          },
          text: 'Submit OTP',
          loadingState: state is VerifyingOtp,
        );
      },
    );
  }
}

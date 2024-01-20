import 'package:careem_clone/constants/gaps.dart';
import 'package:careem_clone/constants/padding.dart';
import 'package:careem_clone/helpers/timer_notifier.dart';
import 'package:careem_clone/views/screens/otp_screen/otp_screen/components/otp_text_field_com.dart';
import 'package:careem_clone/views/screens/otp_screen/otp_screen/components/screen_description_comp.dart';
import 'package:careem_clone/views/screens/otp_screen/otp_screen/components/send_otp_button_comp.dart';
import 'package:careem_clone/views/screens/otp_screen/otp_screen/components/verify_sending_code_comp.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  final TimerNotifier _timerNotifier;
  final TextEditingController _pinController;

  OtpScreen(this._timerNotifier, this._pinController, {super.key});

  @override
  Widget build(BuildContext context) {
    final mobileNumber = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Padding(
        padding: padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gap56,
            ScreenDescriptionComp(mobileNumber: mobileNumber),
            gap24,
            OtpTextFieldComp(),
            gap12,
            VerifySendingCodeComp(
                timerNotifier: _timerNotifier, mobileNumber: mobileNumber),
            gap24,
            SendOtpButtonComp(
                timerNotifier: _timerNotifier, pinController: _pinController,),
          ],
        ),
      ),
    );
  }
}

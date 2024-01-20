import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../constants/padding.dart';

class OtpTextFieldComp extends StatefulWidget {
  OtpTextFieldComp({super.key});

  static late String otpCode;

  @override
  State<OtpTextFieldComp> createState() => _OtpTextFieldCompState();
}

class _OtpTextFieldCompState extends State<OtpTextFieldComp> {
  final _pinController = TextEditingController();

  final int otpTextFieldAnimationDurationInMilliSeconds = 3;

  @override
  void dispose() {
    super.dispose();
    _pinController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return

        /// TODO: Change text color of PinCodeTextField
        PinCodeTextField(
      controller: _pinController,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      backgroundColor: Theme.of(context).colorScheme.background,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        fieldOuterPadding: padding0,
        activeFillColor: Theme.of(context).colorScheme.primary,
        inactiveFillColor: Theme.of(context).colorScheme.background,
        inactiveColor: Theme.of(context).colorScheme.primary,
        activeColor: Theme.of(context).colorScheme.primary,
        selectedFillColor: Theme.of(context).colorScheme.primary,
        selectedColor: Theme.of(context).colorScheme.background,
      ),
      animationDuration:
          Duration(milliseconds: otpTextFieldAnimationDurationInMilliSeconds),
      enableActiveFill: true,
      onCompleted: (otp) {
        OtpTextFieldComp.otpCode = otp;
      },
      appContext: context,
    );
  }
}

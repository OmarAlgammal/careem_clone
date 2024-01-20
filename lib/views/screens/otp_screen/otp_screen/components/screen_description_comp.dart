import 'package:flutter/material.dart';

class ScreenDescriptionComp extends StatelessWidget {
  const ScreenDescriptionComp({super.key, required this.mobileNumber});

  final String mobileNumber;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Verify your mobile number \n \n',
        style: Theme
            .of(context)
            .textTheme
            .titleLarge,
        children: [
          TextSpan(
            text:
            'Enter the verification code we just sent to $mobileNumber',
            style: Theme
                .of(context)
                .textTheme
                .titleMedium,
          ),
        ],
      ),
    );
  }
}

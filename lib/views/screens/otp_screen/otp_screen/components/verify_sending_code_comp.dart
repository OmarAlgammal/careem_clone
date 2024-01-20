import 'package:careem_clone/utils/extensions/extensions/theme_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../controller/auth_cubit/login_cubit.dart';
import '../../../../../helpers/timer_notifier.dart';

class VerifySendingCodeComp extends StatefulWidget {
  const VerifySendingCodeComp(
      {super.key, required this.timerNotifier, required this.mobileNumber});

  final String mobileNumber;
  final TimerNotifier timerNotifier;

  @override
  State<VerifySendingCodeComp> createState() => _VerifySendingCodeCompState();
}

class _VerifySendingCodeCompState extends State<VerifySendingCodeComp> {
  @override
  void initState() {
    super.initState();
    widget.timerNotifier.startTimer();
  }

  Color _requestOtpTextColor() {
    return widget.timerNotifier.isActive
        ? context.colorScheme.onSecondary.withOpacity(.6)
        : context.colorScheme.primary;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            text: 'Did not receive an OTP ?  ',
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              WidgetSpan(
                child: ValueListenableBuilder(
                  valueListenable: widget.timerNotifier,
                  builder: (context, value, child) {
                    return RichText(
                      text: TextSpan(
                        text: 'Resend a new OTP ',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            LoginCubit.instance(context).signInWithMobileNumber(
                                mobileNumber: widget.mobileNumber);
                          },
                        style: TextStyle(
                          color: _requestOtpTextColor(),
                        ),
                        children: [
                          if (widget.timerNotifier.isActive)
                            TextSpan(
                              text: 'after $value s',
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

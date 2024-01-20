import 'package:flutter/material.dart';

import '../../../../../constants/gaps.dart';

class ScreenDescriptionLoginScreenComp extends StatelessWidget {
  const ScreenDescriptionLoginScreenComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Enter your mobile number',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.normal),
        ),
        gap8,
        Text(
          'Enter your number to create a new account or login',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

import 'package:careem_clone/constants/gaps.dart';
import 'package:careem_clone/views/widgets/careem_card.dart';
import 'package:careem_clone/views/widgets/careem_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/careem_lis_tile.dart';

class ChangingUserCity extends StatelessWidget {
  const ChangingUserCity({super.key});

  @override
  Widget build(BuildContext context) {
    return CareemCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CareemListTile(
            title: 'Need to change your city?',
            subTitle: 'Your currently selected city is -city name-',
          ),
          gap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CareemElevatedButton(
                onPressed: () {},
                text: 'Select city',
              ),
              gap8,
              CareemElevatedButton(
                onPressed: () {},
                text: 'Use current location',
              ),
            ],
          )
        ],
      ),
    );
  }
}

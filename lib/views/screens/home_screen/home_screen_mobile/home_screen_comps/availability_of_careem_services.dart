import 'package:careem_clone/constants/gaps.dart';
import 'package:careem_clone/constants/icons.dart';
import 'package:careem_clone/utils/extensions/extensions/theme_extension.dart';
import 'package:careem_clone/views/widgets/careem_card.dart';
import 'package:careem_clone/views/widgets/careem_elevated_button.dart';
import 'package:careem_clone/views/widgets/careem_lis_tile.dart';
import 'package:flutter/material.dart';

class AvailabilityOfCareemServices extends StatelessWidget {
  const AvailabilityOfCareemServices({super.key});

  @override
  Widget build(BuildContext context) {
    return CareemCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CareemListTile(
            title: 'Careem isn\'t available here',
            subTitle: 'You can explore Careem in other cities',
            leading: Icon(
              locationIcon,
            ),
          ),
          gap8,
          CareemElevatedButton(
              onPressed: () {
                /// TODO: Select the city action
              },
              text: 'Select city'),
        ],
      ),
    );
  }
}

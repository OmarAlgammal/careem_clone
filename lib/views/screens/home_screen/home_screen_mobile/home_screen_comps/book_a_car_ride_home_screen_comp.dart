import 'package:careem_clone/constants/border.dart';
import 'package:careem_clone/constants/padding.dart';
import 'package:careem_clone/utils/extensions/enums/elevated_button_style.dart';
import 'package:careem_clone/utils/extensions/extensions/theme_extension.dart';
import 'package:careem_clone/views/widgets/careem_card.dart';
import 'package:careem_clone/views/widgets/careem_elevated_button.dart';
import 'package:careem_clone/views/widgets/careem_lis_tile.dart';
import 'package:careem_clone/views/widgets/careem_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/gaps.dart';
import '../../../../../constants/icons.dart';

class BookACarRideHomeScreenComp extends StatelessWidget {
  const BookACarRideHomeScreenComp({super.key});

  @override
  Widget build(BuildContext context) {
    return CareemCard(
      cardColor: context.colorScheme.background,
      useElevation: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Book a ride',
            style: context.textTheme.titleLarge,
          ),
          gap12,
          CareemListTile(
            title: 'Enter your destination',
            leading: Icon(
              Icons.circle_rounded,
              size: 18.sp,
            ),
            trailing: Icon(
              searchIcon,
              color: context.colorScheme.primary,
            ),
          ),
          CareemTextButton(
            onPressed: () {},
            text: 'Select dropoff',
          ),
        ],
      ),
    );
  }
}

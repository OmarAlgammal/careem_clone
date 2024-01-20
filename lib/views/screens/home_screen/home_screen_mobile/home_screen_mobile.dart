import 'package:careem_clone/constants/gaps.dart';
import 'package:careem_clone/constants/padding.dart';
import 'package:careem_clone/views/screens/home_screen/home_screen_mobile/home_screen_comps/availability_of_careem_services.dart';
import 'package:careem_clone/views/screens/home_screen/home_screen_mobile/home_screen_comps/book_a_car_ride_home_screen_comp.dart';
import 'package:careem_clone/views/screens/home_screen/home_screen_mobile/home_screen_comps/changing_user_city.dart';
import 'package:flutter/material.dart';

import 'home_screen_comps/app_bar_home_screen_comp.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHomeScreenComp(),
      body: Padding(
        padding: padding16,
        child: Column(
          children: [
            AvailabilityOfCareemServices(),
            ChangingUserCity(),
            gap24,
            BookACarRideHomeScreenComp(),
          ],
        ),
      ),
    );
  }
}

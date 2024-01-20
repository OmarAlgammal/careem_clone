
import 'package:careem_clone/controller/auth_cubit/app_theme/app_theme_providerr.dart';
import 'package:careem_clone/service_locator/service_locator.dart';
import 'package:careem_clone/utils/extensions/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CareemCircleIcon extends StatelessWidget {
  const CareemCircleIcon({super.key, required this.icon, this.iconSize});

  final IconData icon;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 40.sp,
      child: CircleAvatar(
        backgroundColor: context.colorScheme.scrim,
        child: Icon(
          icon,
          color: context.colorScheme.background,
          size: iconSize ?? 18.sp,
        ),
      ),
    );
  }
}

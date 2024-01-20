import 'package:careem_clone/utils/extensions/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CareemCircularProgressIndicator extends StatelessWidget {
  const CareemCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 24.sp,
      child: CircularProgressIndicator(
        color: context.colorScheme.background,
      ),
    );
  }

}

import 'package:careem_clone/constants/padding.dart';
import 'package:careem_clone/utils/extensions/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/border.dart';

class CareemCard extends StatelessWidget {
  const CareemCard({
    super.key,
    required this.child,
    this.cardColor,
    this.useElevation = true,
  });

  final Widget child;
  final Color? cardColor;
  final bool useElevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor ?? context.appTheme.cardColor,
      elevation: useElevation ? 3.sp : 0.0,
      surfaceTintColor: Colors.black,
      borderOnForeground: false,
      shape: RoundedRectangleBorder(
        borderRadius: circular12,
        side: useElevation
            ? BorderSide.none
            : BorderSide(
                color: context.appTheme.dividerColor,
                width: 1.2.sp,
              ),
      ),
      child: Padding(
        padding: padding16,
        child: child,
      ),
    );
  }
}

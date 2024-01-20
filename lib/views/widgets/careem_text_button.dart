import 'package:careem_clone/constants/border.dart';
import 'package:careem_clone/utils/extensions/extensions/theme_extension.dart';
import 'package:careem_clone/views/widgets/careem_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/extensions/enums/elevated_button_style.dart';

class CareemTextButton extends StatelessWidget {
  const CareemTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.styleName = CareemElevatedButtonStyle.primary,
    this.loadingState = false,

  });

  final String text;
  final VoidCallback onPressed;
  final CareemElevatedButtonStyle styleName;
  final bool loadingState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(
            Size(double.infinity, 56),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: circular32,
              side: BorderSide(
                color: context.appTheme.dividerColor,
                width: 1.sp,
              )
            ),
          ),
        ),
        onPressed: onPressed,
        child: loadingState
            ? const CareemCircularProgressIndicator()
            : Text(
                text,
          style: context.textTheme.labelLarge!.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: context.colorScheme.primary,
          ),
              ),
      ),
    );
  }

  Color getBackgroundColor(BuildContext context) {
    return switch (styleName) {
      (CareemElevatedButtonStyle.primary) => context.colorScheme.primary,
      CareemElevatedButtonStyle.secondary => context.colorScheme.background,
    };
  }

  Color getTextColor(BuildContext context) {
    return switch (styleName) {
      (CareemElevatedButtonStyle.primary) => context.colorScheme.background,
      CareemElevatedButtonStyle.secondary => context.colorScheme.primary,
    };
  }
}

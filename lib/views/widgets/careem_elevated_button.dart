import 'package:careem_clone/constants/border.dart';
import 'package:careem_clone/utils/extensions/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CareemElevatedButton extends StatelessWidget {
  const CareemElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.sp,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            context.appTheme.scaffoldBackgroundColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: circular32,
            ),
          ),
          fixedSize: MaterialStateProperty.all(
            const Size.fromHeight(56),
          ),
        ),
        child: Text(
          text,
          style: context.textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: context.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

import 'package:careem_clone/utils/extensions/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/padding.dart';

class CareemListTile extends StatelessWidget {
  const CareemListTile({
    super.key,
    required this.title,
    this.subTitle,
    this.leading,
    this.trailing,
  });

  final String title;
  final String? subTitle;
  final Widget? leading;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: padding0,
      //horizontalTitleGap: -12.0.sp,
      title: Text(
        title,
        style: context.textTheme.labelLarge,
      ),
      subtitle: Text(
        subTitle ?? '',
        style: context.textTheme.labelMedium,
      ),
      leading: leading,
      trailing: trailing,
    );
  }
}

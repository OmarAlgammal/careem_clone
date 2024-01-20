import 'package:careem_clone/utils/extensions/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/images.dart';

class AppLogoLoginScreenComp extends StatelessWidget {
  const AppLogoLoginScreenComp({super.key});

  @override
  Widget build(BuildContext context) {
    /// TODO: Replace this text with logo
    return Flexible(
      flex: 1,
      child: Align(
        alignment: Alignment.center,
        child: SvgPicture.asset(
          Assets.imagesCareemLogo,
          height: 172.h,
          colorFilter: ColorFilter.mode(
            context.colorScheme.primary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

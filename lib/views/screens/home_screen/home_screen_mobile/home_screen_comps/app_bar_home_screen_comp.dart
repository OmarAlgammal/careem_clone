import 'package:careem_clone/app_theme/light_theme/light_theme.dart';
import 'package:careem_clone/constants/icons.dart';
import 'package:careem_clone/constants/images.dart';
import 'package:careem_clone/constants/padding.dart';
import 'package:careem_clone/utils/extensions/extensions/theme_extension.dart';
import 'package:careem_clone/views/widgets/careem_circle_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarHomeScreenComp extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarHomeScreenComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding8,
      child: AppBar(
        backgroundColor: appLightTheme.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: SvgPicture.asset(
          Assets.imagesCareemLogo,
          width: 94.sp,
          colorFilter: ColorFilter.mode(
            context.colorScheme.primary,
            BlendMode.srcIn,
          ),
        ),
        actions: const [
          CareemCircleIcon(
            icon: menuIcon,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(64.sp);
}

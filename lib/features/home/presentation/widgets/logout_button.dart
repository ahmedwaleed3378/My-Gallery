import 'package:bookly_app/core/utls/app_prefferences.dart';
import 'package:bookly_app/core/utls/app_router.dart';
import 'package:bookly_app/core/utls/assets.dart';
import 'package:bookly_app/core/utls/color_manager.dart';
import 'package:bookly_app/features/home/presentation/widgets/home_page_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
    required this.appPreferences,
  });

  final AppPreferences appPreferences;

  @override
  Widget build(BuildContext context) {
    return HomePageButton(
      widgetContent: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            AssetsData.redIcon,
            height: 3.8.h,
            width: 5.h,
          ),
          Icon(
            Icons.arrow_back_sharp,
            color: whiteColor,
            size: 20.sp,
          ),
        ],
      ),
      onTap: () {
        appPreferences.logout().then(
          (value) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouter.loginScreen,
              (route) => false,
            );
          },
        );
      },
      text: 'log out',
    );
  }
}

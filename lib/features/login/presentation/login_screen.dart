import 'package:bookly_app/core/utls/assets.dart';
import 'package:bookly_app/core/utls/color_manager.dart';
import 'package:bookly_app/core/utls/styles.dart';
import 'package:bookly_app/features/widgets/background_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'widgets/background_circle.dart';
import 'widgets/login_components.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              BackgroundCircle(
                topMargin: 15.h,
                leftMargin: -20.w,
                color: purple,
                width: 50.w,
                height: 30.h,
              ),
              const BackgroundGradient(),
              BackgroundCircle(
                topMargin: -20.h,
                leftMargin: 55.w,
                opacity: 1,
                color: primaryColor,
                width: 80.w,
                height: 75.h,
              ),
              Positioned(
                top: -17.h,
                left: -15.w,
                child: SvgPicture.asset(
                  AssetsData.loginBackgroundItem4,
                  height: 37.h,
                  width: 70.w,
                ),
              ),
              Positioned(
                bottom: 18.h,
                left: 36.w,
                child: SvgPicture.asset(
                  AssetsData.loginBackgroundItem2,
                  height: 12.h,
                  width: 12.h,
                ),
              ),
              Positioned(
                bottom: 32.h,
                left: 37.w,
                child: SvgPicture.asset(
                  AssetsData.loginBackgroundItem3,
                  height: 32.h,
                  width: 32.h,
                ),
              ),
              Positioned(
                bottom: 45.h,
                left: 11.w,
                child: SvgPicture.asset(
                  AssetsData.loginBackgroundItem1,
                  height: 15.h,
                  width: 15.h,
                ),
              ),
              Positioned(
                top: -7.h,
                left: -2.w,
                child: Image.asset(
                  AssetsData.loveCamera,
                  height: 35.h,
                  width: 60.w,
                ),
              ),
              Positioned(
                top: 17.h,
                // left: .w,
                child: Text(
                  'My\nGellary',
                  textAlign: TextAlign.center,
                  style: getBoldtextStyle(
                    color: black2,
                    fontSize: 26.sp,
                  ).copyWith(height: 1.2),
                ),
              ),
              const LoginComponents(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    LoginForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

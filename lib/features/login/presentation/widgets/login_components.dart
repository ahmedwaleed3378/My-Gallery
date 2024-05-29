import 'dart:ui';
import 'package:bookly_app/core/utls/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginComponents extends StatelessWidget {
  const LoginComponents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35.h,
      // left: .w,
      child: Column(
        children: [
          Container(
            height: 48.h,
            width: 87.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 15.0,
                  sigmaY: 15.0,
                ),
                child: Container(
                  color: whiteColor.withOpacity(0.38),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

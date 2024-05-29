import 'package:bookly_app/core/utls/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [
            0.1,
            0.6,
            0.85,
          ],
          colors: [
            whiteColor.withOpacity(0.001),
            mistyRose,
            whiteColor,
          ],
        ),
      ),
    );
  }
}
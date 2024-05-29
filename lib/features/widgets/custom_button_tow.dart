import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/utls/styles.dart';

class CustomButtonTow extends StatelessWidget {
  const CustomButtonTow({
    super.key,
    required this.onPressed,
    required this.title,
    required this.textColor,
    required this.backGround,
    this.width,
    this.textSize,
    this.height,
  });
  final VoidCallback onPressed;
  final String title;
  final double? width;
  final double? textSize;
  final double? height;
  final Color textColor;
  final Color backGround;

  // final AppPreferences _appPreferences = getIt<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          Size(
            width ?? 40.w,
            height ?? 5.h,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        elevation: MaterialStateProperty.all(5),
        backgroundColor: MaterialStateProperty.all(
          backGround,
        ),
      ),
      child: Text(
        title,
        
        style: getSemiBoldtextStyle(
          color: textColor,
          fontSize: textSize ?? 18.px,
        ),
      ),
    );
  }
}

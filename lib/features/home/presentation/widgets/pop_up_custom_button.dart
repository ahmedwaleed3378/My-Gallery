import 'dart:ui';
import 'package:bookly_app/core/utls/color_manager.dart';
import 'package:bookly_app/core/utls/styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PopUpCustomButton extends StatelessWidget {
  const PopUpCustomButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.text,
    required this.img,
  });
  final VoidCallback onTap;
  final Color color;
  final String text;
  final String img;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          color,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              17.sp,
            ),
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          Size(
            55.w,
            7.h,
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: 2.w,
            vertical: 0.2.h,
          ),
        ),
      ),
      onPressed: () {
        onTap();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            img,
            height: 17.w,
            width: 17.w,
          ),
          Column(
            children: [
              SizedBox(
                height: 0.3.h,
              ),
              Text(
                text,
                style: getSemiBoldtextStyle(
                  color: black2,
                  fontSize: 21.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

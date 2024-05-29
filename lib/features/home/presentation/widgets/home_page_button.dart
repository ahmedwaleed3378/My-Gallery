import 'package:bookly_app/core/utls/color_manager.dart';
import 'package:bookly_app/core/utls/styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePageButton extends StatelessWidget {
  const HomePageButton({
    super.key,
    required this.widgetContent,
    required this.onTap,
    required this.text,
  });
  final String text;
  final Widget widgetContent;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 1.w,
        ),
        height: 5.h,
        width: 35.w,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(
            25.sp,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 2.w,
            ),
            widgetContent,
            SizedBox(
              width: 2.w,
            ),
            Text(
              text,
              style: getRegulartextStyle(
                color: blackColor,
                fontSize: 19.sp,
              ).copyWith(fontFamily: 'Baloo Thambi 2'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BackgroundCircle extends StatelessWidget {
  const BackgroundCircle({
    super.key,
    required this.topMargin,
    this.leftMargin,
    required this.color,
    required this.width,
    required this.height,
    this.opacity,
  });
  final double topMargin;
  final double? leftMargin;
  final double? opacity;
  final Color color;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      left: leftMargin,
      child: Opacity(
        opacity: opacity ?? 0.7,
        child: Container(
          height: height,
          width: width,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              50.w,
            ),
            boxShadow: [
              BoxShadow(
                color: color,
                offset: Offset(0, 2),
                blurRadius: 40.w,
                spreadRadius: 15.w,
              ),
              BoxShadow(
                color: color,
                offset: Offset(0, 0),
                blurRadius: 40.w,
                spreadRadius: 15.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

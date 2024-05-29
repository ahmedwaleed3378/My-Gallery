import 'dart:async';

import 'package:bookly_app/core/utls/color_manager.dart';
import 'package:bookly_app/core/utls/styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//ignore: must_be_immutable
class CustomButtonWidget extends StatefulWidget {
  CustomButtonWidget({
    Key? key,
    this.backGroundColor = primaryColor,
    this.borderColor = transparent,
    required this.title,
    this.shadowColor = transparent,
    this.onTap,
    this.icon,
    this.iconColor,
    this.textColor = whiteColor,
    this.style,
    this.height,
    this.widget,
    this.fontSize,
    this.borderWidth = 1,
    this.width,
  }) : super(key: key);
  final Color backGroundColor;
  final Color borderColor;

  final String title;
  final Color shadowColor;
  Function? onTap;
  final Color textColor;
  IconData? icon;
  Color? iconColor;
  TextStyle? style;
  double? height;
  Widget? widget;
  double? fontSize;
  double? width;
  final double borderWidth;

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  bool isExpanded = false;

  void expandAndShrink() {
    setState(() {
      isExpanded = true;
    });

    Timer(const Duration(milliseconds: 300), () {
      setState(() {
        isExpanded = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      height: isExpanded ? 5.h : widget.height ?? 6.h,
      width: isExpanded ? 82.w : widget.width ?? 91.w,
      child: Material(
        shadowColor: widget.onTap != null ? widget.shadowColor : primaryColor,
        elevation: 3,
        borderRadius: BorderRadius.circular(16),
        color: widget.onTap != null ? widget.backGroundColor : primaryColor,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.backGroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                width: widget.borderWidth,
                color: widget.onTap != null ? widget.borderColor : primaryColor,
              ),
            ),
          ),
          onPressed: widget.onTap != null
              ? () {
                  expandAndShrink();
                  widget.onTap!();
                }
              : null,
          child: widget.widget ??
              (widget.icon != null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          widget.icon,
                          color: widget.iconColor ?? whiteColor,
                          size: 2.h,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          widget.title,
                          style: getMediumtextStyle(
                              color: widget.textColor, fontSize: 18.px),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  : Text(
                      widget.title,
                      style: widget.style ??
                          getRegulartextStyle(
                            color: widget.textColor,
                            fontSize: widget.fontSize ?? 19.px,
                          ),
                      textAlign: TextAlign.center,
                    )),
        ),
      ),
    );
  }
}

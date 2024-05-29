import 'package:bookly_app/core/utls/color_manager.dart';
import 'package:bookly_app/core/utls/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAuthFormFiled extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final String? labelText;
  final TextInputType keyboardType;
  final void Function(String)? onFieldSubmitted;

  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final bool obscureText;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final String hintText;
  final String? upHintText;
  final String? suffixText;
  final String? errorText;
  final TextStyle? suffixTextStyle;
  final Color backgroundColor;
  final Color? shadowColor;
  final Color? hintColor;
  final Color? borderColor;
  final Color textColor;
  final Color labelColor;
  final Color? cursorColor;
  final double radius;
  final double? height;
  final double? width;
  final double? elevation;
  final double? labelSize;

  //final int? maxLines;
  final double horizontalPadding;
  final double verticalPadding;
  final InputBorder? inputBorder;
  final InputBorder? inputEnabledBorder;
  final InputBorder? inputFocusedBorder;
  final InputBorder? inputDisabledBorder;
  final EdgeInsetsGeometry? contentPadding;
  final AlignmentGeometry? containerAlignment;
  final BoxConstraints? suffixIconConstraints;
  final bool readOnly;
  final bool removeFocus;
  final int? maxLength;
  final int? errorMaxLines;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final bool? showBorder;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? errorStyle;
  final TextStyle? textStyle;

  const CustomAuthFormFiled({
    Key? key,
    required this.controller,
    this.validator,
    this.onTap,
    this.showBorder,
    this.borderColor,
    this.labelText,
    required this.keyboardType,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onChanged,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.initialValue,
    required this.hintText,
    this.upHintText,
    required this.backgroundColor,
    this.height,
    this.radius = 30.0,
    this.elevation,
    // this.maxLines,
    this.enabled = true,
    this.inputBorder =
        const OutlineInputBorder(borderSide: BorderSide(width: 1)),
    this.inputEnabledBorder,
    this.inputFocusedBorder,
    this.inputDisabledBorder,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    required this.textColor,
    required this.labelColor,
    this.contentPadding,
    this.containerAlignment,
    this.suffixText,
    this.suffixTextStyle,
    this.suffixIconConstraints,
    this.readOnly = false,
    this.removeFocus = true,
    this.cursorColor,
    this.maxLength,
    this.errorMaxLines = 2,
    this.textDirection = TextDirection.ltr,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.autofocus = false,
    this.inputFormatters,
    this.errorText,
    this.errorStyle,
    this.shadowColor,
    this.labelSize,
    this.textStyle,
    this.hintColor,
    this.width,
  }) : super(key: key);

  @override
  State<CustomAuthFormFiled> createState() => _CustomAuthFormFiledState();
}

class _CustomAuthFormFiledState extends State<CustomAuthFormFiled> {
  Color color = whiteColor;

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    widget.controller.addListener(() {
      color = widget.backgroundColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: SizedBox(
        height: widget.height ?? 6.h,
        width: widget.width ?? 6.h,
        child: Material(
          shadowColor: widget.shadowColor ?? blackColor,
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          elevation: widget.elevation ?? 0,
          child: TextFormField(
            textAlign: widget.textAlign,
            inputFormatters: widget.inputFormatters ?? <TextInputFormatter>[],
            // Only numbers can be entered
            autofocus: widget.autofocus,
            // onTapOutside: (event) {
            //   if (widget.removeFocus) {
            //     FocusManager.instance.primaryFocus?.unfocus();
            //   }
            // },
            textInputAction: widget.textInputAction,
            maxLength: widget.maxLength,
            readOnly: widget.readOnly,
            cursorColor: widget.cursorColor ?? blackColor,
            enabled: widget.enabled,
            textAlignVertical: TextAlignVertical.center,
            // textAlign: Localizations.localeOf(context) == const Locale('en')
            //     ? TextAlign.start
            //     : TextAlign.end,
            //   maxLines: maxLines,
            textDirection: widget.textDirection,
            initialValue: widget.initialValue,
            controller: widget.controller,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            onFieldSubmitted: widget.onFieldSubmitted,
            onEditingComplete: widget.onEditingComplete,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            obscureText: widget.obscureText,
            style: widget.textStyle ??
                Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16.px,
                    color: widget.textColor,
                    fontFamily: 'Segoe UI'),
            decoration: InputDecoration(
              errorStyle: widget.errorStyle,
              counterText: '',
              hintStyle: TextStyle(
                color: widget.hintColor ?? lightGrey,
              ),
              errorText: widget.errorText,
              suffixStyle: widget.suffixTextStyle,
              fillColor: widget.backgroundColor,
              labelStyle: getMediumtextStyle(
                color: widget.labelColor,
                fontSize: widget.labelSize ?? 17.4.px,
              ),
              filled: true,
              suffixText: widget.suffixText,
              errorMaxLines: widget.errorMaxLines,
              contentPadding: widget.contentPadding ??
                  EdgeInsets.symmetric(
                    vertical: 0.5.h,
                    horizontal: 4.w,
                  ),
              labelText: widget.labelText,
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon,
              border: InputBorder.none,
              suffixIcon: widget.suffixIcon,

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: (widget.showBorder ?? true)
                      ? widget.borderColor ?? lightGrey
                      : transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.radius),
                ),
              ),

              // focused border style
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: whiteColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.radius),
                ),
              ),

              errorBorder: OutlineInputBorder(
                // gapPadding: 4.w,
                borderSide: const BorderSide(
                  color: whiteColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(widget.radius),
                  topRight: Radius.circular(widget.radius),
                ),
              ),

              // error focused border style
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: whiteColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(widget.radius),
                  topRight: Radius.circular(widget.radius),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

TextStyle _getTextStyle(
    String fontFamily, double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color);
}

TextStyle getSemiBoldtextStyle({
  double fontSize = 12,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize.px,
    color: color,
    fontWeight: FontWeightManager.semiBold,
     fontFamily: 'Segoe UI',
  );
}

TextStyle getBoldtextStyle({
  double fontSize = 12,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize.px,
    color: color,
    fontWeight: FontWeightManager.bold,
 fontFamily: 'Segoe UI',
  );
}

TextStyle getRegulartextStyle({
  double fontSize = 12,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize.px,
    color: color,
    fontWeight: FontWeightManager.regular,
     fontFamily: 'Segoe UI',
  );
}

TextStyle getLighttextStyle({
  double fontSize = 12,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize.px,
    color: color,
    fontWeight: FontWeightManager.light,
     fontFamily: 'Segoe UI',
  );
}

TextStyle getMediumtextStyle({
  double fontSize = 12,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize.px,
    color: color,
    fontWeight: FontWeightManager.medium,
     fontFamily: 'Segoe UI',
  );
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

import 'package:extra_set_of_mitts/constants/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final double radius;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final Color suffixIconColor;
  final Color focusedBorderColor;
  final double focusedBorderWidth;
  final Color outlineBorderColor;
  final double outlineBorderWidth;
  final String hintText;
  final double hintTextFontSize;
  final Color hintTextFontColor;
  final bool filled;
  final Color backgroundColor;
  final double contentPaddingLeft;
  final double contentPaddingRight;
  final double contentPaddingBottom;
  final double contentPaddingTop;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final String? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final double iconScale;
  final bool prefixIconNeed;
  final String prefixIconString;
  final Color prefixIconColor;
  //final bool needSvgInPrefix;

  const CustomTextField({
    super.key,
    required this.controller,
    this.radius = 12,
    this.borderRadius = 12,
    this.borderColor = kPrimaryColor,
    this.borderWidth = 1,
    this.suffixIconColor = kPrimaryColor,
    this.focusedBorderColor = kPrimaryColor,
    this.focusedBorderWidth = 1,
    this.outlineBorderColor = kPrimaryColor,
    this.outlineBorderWidth = 1,
    required this.hintText,
    this.hintTextFontSize = 14,
    this.hintTextFontColor = kPrimaryColor,
    this.filled = true,
    this.backgroundColor = kTertiaryColor,
    this.contentPaddingLeft = 20,
    this.contentPaddingRight = 20,
    this.contentPaddingBottom = 20,
    this.contentPaddingTop = 20,
    this.left = 20,
    this.right = 20,
    this.top = 20,
    this.bottom = 20,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.iconScale = 4,
    this.prefixIconNeed = false,
    this.prefixIconString = '',
    this.prefixIconColor = kPrimaryColor,
    //this.needSvgInPrefix = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: TextFormField(
        cursorColor: kTertiaryColor,
        obscureText: obscureText,
        style: TextStyle(color: kGreyColor2),
        decoration: InputDecoration(
          prefixIcon: (prefixIconNeed == false)
              ? null
              : Image.asset(prefixIconString,
                  scale: iconScale, color: prefixIconColor),
          suffixIcon: suffixIcon,
          filled: filled,
          fillColor: backgroundColor,
          hintText: hintText,
          hintStyle: TextStyle(
              color: kGreyColor2,
              fontSize: hintTextFontSize,
              fontWeight: FontWeight.w400),
          border: outlineInputBorderDecoration(
              r: borderRadius, borderClr: borderColor, width: borderRadius),
          focusedBorder: outlineInputBorderDecoration(
              r: radius,
              borderClr: focusedBorderColor,
              width: focusedBorderWidth),
          enabledBorder: outlineInputBorderDecoration(
              r: radius,
              borderClr: outlineBorderColor,
              width: outlineBorderWidth),
          contentPadding: EdgeInsets.only(
              left: contentPaddingLeft,
              bottom: contentPaddingBottom,
              top: contentPaddingTop,
              right: contentPaddingRight),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorderDecoration(
      {double? r, Color? borderClr, double? width}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(r!),
      borderSide: BorderSide(color: borderClr!, width: width!),
    );
  }
}

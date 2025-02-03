import 'package:flutter/material.dart';
import 'package:two_local_gals_housekeeping/constants/app_colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
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
  final String suffixIcon;
  final bool suffixIconNeed;
  final bool obscureText;
  final double iconScale;
  final bool prefixIconNeed;
  final String prefixIcon;
  final Color prefixIconColor;
  //final bool needSvgInPrefix;

  CustomTextField({
    super.key,
    required this.controller,
    this.radius = 12,
    this.borderRadius = 0,
    this.borderColor = kTransparentColor,
    this.borderWidth = 0,
    this.focusedBorderColor = kGreyColor2,
    this.focusedBorderWidth = 1,
    this.outlineBorderColor = kPrimaryColor,
    this.outlineBorderWidth = 1,
    required this.hintText,
    this.hintTextFontColor = kGreyColor2,
    this.hintTextFontSize = 14,
    this.filled = true,
    this.backgroundColor = kPrimaryColor,
    this.contentPaddingLeft = 0,
    this.contentPaddingRight = 0,
    this.contentPaddingBottom = 18,
    this.contentPaddingTop = 18,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.suffixIcon = '',
    this.suffixIconNeed = false,
    this.obscureText = false,
    this.iconScale = 4,
    this.suffixIconColor = kGreyColor2,
    this.prefixIconNeed = false,
    this.prefixIcon = '',
    this.prefixIconColor = kGreyColor2,
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
              : Image.asset(prefixIcon,
                  scale: iconScale, color: prefixIconColor),
          suffixIcon: (suffixIconNeed == false)
              ? null
              : Image.asset(suffixIcon,
                  scale: iconScale, color: suffixIconColor),
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

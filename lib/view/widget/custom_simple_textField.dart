import 'package:extra_set_of_mitts/constants/app_colors.dart';
import 'package:extra_set_of_mitts/constants/app_fonts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSimpleTextField extends StatelessWidget {
  TextEditingController txtController = TextEditingController();
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
  final String img;
  final bool suffixIcon;
  final bool obscureText;
  final double iconScale;
  final bool expands;
  final int maxLines;

  CustomSimpleTextField({
    super.key,
    required this.txtController,
    this.radius = 12,
    this.borderRadius = 0,
    this.borderColor = kGreyColor6,
    this.borderWidth = 0,
    this.focusedBorderColor = kGreyColor2,
    this.focusedBorderWidth = 1,
    this.outlineBorderColor = kGreyColor6,
    this.outlineBorderWidth = 1,
    required this.hintText,
    this.hintTextFontColor = kBlackColor1,
    this.hintTextFontSize = 10,
    this.filled = false,
    this.backgroundColor = kGreyColor5,
    this.contentPaddingLeft = 15,
    this.contentPaddingRight = 0,
    this.contentPaddingBottom = 0,
    this.contentPaddingTop = 0,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.img = '',
    this.suffixIcon = false,
    this.obscureText = false,
    this.iconScale = 4,
    this.suffixIconColor = kTransparentColor,
    this.expands = false,
    this.maxLines = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: TextField(
        cursorHeight: 15,
        cursorWidth: 1,
        cursorColor: kGreyColor2,
        expands: expands,
        maxLines: maxLines,
        // expands: expand,

        obscureText: obscureText,
        style: TextStyle(fontFamily: AppFonts.Jost, color: kBlackColor1),
        decoration: InputDecoration(
          suffixIcon: suffixIcon == false
              ? null
              : Image.asset(img, scale: iconScale, color: suffixIconColor),
          filled: filled,
          fillColor: backgroundColor,
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: AppFonts.Jost,
            color: hintTextFontColor,
            fontSize: hintTextFontSize,
          ),
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

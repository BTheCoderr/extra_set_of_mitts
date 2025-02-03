import 'package:flutter/material.dart';
import 'package:two_local_gals_housekeeping/constants/app_colors.dart';
import 'package:two_local_gals_housekeeping/view/widget/my_text_widget.dart';

class CustomRectangleBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String txt;
  final Color txtColor;
  final Color backgroundBtnColor;
  final Color borderSideColor;
  final double borderStroke;

  final double btnHeight;
  final double btnWidth;
  final double btnRadius;
  final FontWeight fontWeight;
  final double textSize;

  const CustomRectangleBtn({
    super.key,
    required this.onPressed,
    required this.txt,
    this.btnHeight = 56,
    this.btnWidth = 100,
    this.btnRadius = 12,
    this.fontWeight = FontWeight.w500,
    this.textSize = 20,
    this.txtColor = kPrimaryColor,
    this.backgroundBtnColor = kTertiaryColor,
    this.borderSideColor = kTransparentColor,
    this.borderStroke = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundBtnColor,
          elevation: 0,
          side: BorderSide(width: borderStroke, color: borderSideColor),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(btnRadius)),
          minimumSize: Size(btnWidth, btnHeight),
        ),
        onPressed: onPressed,
        child: MyText(
          text: txt,
          weight: fontWeight,
          color: txtColor,
          size: textSize,
        ));
  }
}

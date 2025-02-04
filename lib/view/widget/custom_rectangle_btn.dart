import 'package:flutter/material.dart';
import 'package:extra_set_of_mitts/constants/app_colors.dart';
import 'package:extra_set_of_mitts/view/widget/my_text_widget.dart';

class CustomRectangleBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String txt;
  final Color txtColor;
  final Color backgroundBtnColor;
  final Color borderSideColor;
  final double borderStroke;
  final bool isLoading;

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
    this.borderStroke = 1,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: btnHeight,
      width: btnWidth,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundBtnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(btnRadius),
            side: BorderSide(
              color: borderSideColor,
              width: borderStroke,
            ),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                ),
              )
            : MyText(
                text: txt,
                color: txtColor,
                weight: fontWeight,
                size: textSize,
              ),
      ),
    );
  }
}

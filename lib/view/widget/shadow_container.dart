import 'package:extra_set_of_mitts/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  final Widget widget;
  final double paddingTop, paddingBottom, paddingRight, paddingLeft;
  final double marginTop;
  final double? height;

  const ShadowContainer({
    super.key,
    required this.widget,
    this.paddingBottom = 0,
    this.paddingLeft = 0,
    this.paddingRight = 0,
    this.paddingTop = 0,
    this.marginTop = 0,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.only(top: marginTop),
      padding: EdgeInsets.only(
          top: paddingTop,
          bottom: paddingBottom,
          right: paddingRight,
          left: paddingLeft),
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: kblackShadowColor.withOpacity(.1),
                blurRadius: 7.47,
                offset: Offset(0, 3))
          ]),
      child: widget,
    );
  }
}

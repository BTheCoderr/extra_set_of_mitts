// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:two_local_gals_housekeeping/constants/app_colors.dart';

// ignore: must_be_immutable
class MyContainer extends StatelessWidget {
  double height, width;
  double paddingLeft, paddingRight, paddingTop, paddingBottom;
  double marginLeft, marginRight, marginTop, marginBottom;

  Widget widget;
  MyContainer({
    super.key,
    required this.widget,
    this.height = 298,
    this.width = double.maxFinite,
    this.paddingLeft = 0,
    this.paddingRight = 0,
    this.paddingTop = 0,
    this.paddingBottom = 0,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.marginTop = 0,
    this.marginBottom = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: paddingLeft,
        right: paddingRight,
        top: paddingTop,
        bottom: paddingBottom,
      ),
      margin: EdgeInsets.only(
        left: marginLeft,
        right: marginRight,
        top: marginTop,
        bottom: marginBottom,
      ),
      //height: height,
      width: width,
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: kBlackColor1.withOpacity(.08),
                blurRadius: 20,
                spreadRadius: 0,
                offset: Offset(0, 10))
          ]),
      child: widget,
    );
  }
}

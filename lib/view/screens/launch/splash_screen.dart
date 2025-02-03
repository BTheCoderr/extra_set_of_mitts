import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:two_local_gals_housekeeping/constants/app_colors.dart';

import 'package:two_local_gals_housekeeping/constants/app_images.dart';
import 'package:two_local_gals_housekeeping/constants/app_sizes.dart';
import 'package:two_local_gals_housekeeping/constants/app_styling.dart';
import 'package:two_local_gals_housekeeping/config/routes/routes.dart';

import 'package:two_local_gals_housekeeping/view/widget/common_image_view_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenHandler();
  }

  void splashScreenHandler() {
    Timer(
      const Duration(seconds: 2),
      () => Get.offNamed(AppLinks.login),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().background_image_decoration(),
      child: Scaffold(
          backgroundColor: kTransparentColor,
          body: Container(
            padding: AppSizes.DEFAULT,
            margin: EdgeInsets.only(top: 248),
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonImageView(
                  height: 174,
                  imagePath: Assets.imagesLogoIcon,
                ),
              ],
            ),
          )),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:two_local_gals_housekeeping/constants/app_colors.dart';
import 'package:two_local_gals_housekeeping/constants/app_images.dart';
import 'package:two_local_gals_housekeeping/view/screens/home/home.dart';
import 'package:two_local_gals_housekeeping/view/widget/common_image_view_widget.dart';
import 'package:two_local_gals_housekeeping/view/widget/custom_bk_icon_button.dart';

class AppStyling {
  // Background Image

  BoxDecoration background_image_decoration() {
    return BoxDecoration(
        color: kPrimaryColor,
        image: DecorationImage(
            image: AssetImage(Assets.imagesBackgroundImg), fit: BoxFit.cover));
  }

// App Bar with setting button

  AppBar appBarWithSettingButton({required VoidCallback onTap}) {
    return AppBar(
      toolbarHeight: 70,
      elevation: 0,
      backgroundColor: kTransparentColor,
      title: CommonImageView(
        radius: 150,
        height: 50,
        width: 50,
        imagePath: Assets.imagesProfileImg,
      ),
      titleSpacing: 20,
      automaticallyImplyLeading: false,
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                IconBtn(
                  onTap: onTap,
                  icon: Assets.imagesSettingIcon,
                ),
                AppStyling().horizantallGap(20),
              ],
            ),
          ],
        ),
      ],
    );
  }

// App Bar with home button

  AppBar appBarWithHomeButton(context) {
    return AppBar(
      toolbarHeight: 70,
      elevation: 0,
      backgroundColor: kTransparentColor,
      title: CommonImageView(
        radius: 150,
        height: 50,
        width: 50,
        imagePath: Assets.imagesProfileImg,
      ),
      titleSpacing: 20,
      automaticallyImplyLeading: false,
      actions: [
        Row(
          children: [
            IconBtn(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
              icon: Assets.imagesHomeIcon,
            ),
            AppStyling().horizantallGap(20),
          ],
        )
      ],
    );
  }

// Sized Box Height

  SizedBox verticalGap(double h) {
    return SizedBox(
      height: h,
    );
  }

// Sized Box Horizantall

  SizedBox horizantallGap(double w) {
    return SizedBox(
      width: w,
    );
  }
}

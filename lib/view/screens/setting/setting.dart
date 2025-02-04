import 'package:flutter/material.dart';
import 'package:extra_set_of_mitts/constants/app_colors.dart';
import 'package:extra_set_of_mitts/constants/app_images.dart';
import 'package:extra_set_of_mitts/constants/app_styling.dart';
import 'package:extra_set_of_mitts/view/screens/onboarding/onboarding_screen.dart';
import 'package:extra_set_of_mitts/view/screens/setting/update_address/update_address.dart';
import 'package:extra_set_of_mitts/view/screens/setting/update_profile_picture/update_profile.dart';
import 'package:extra_set_of_mitts/view/screens/setting/update_unavailability/unavailability.dart';
import 'package:get/get.dart';
import 'package:extra_set_of_mitts/view/widget/common_image_view_widget.dart';
import 'package:extra_set_of_mitts/view/widget/my_container.dart';
import 'package:extra_set_of_mitts/view/widget/my_text_widget.dart';
import 'package:extra_set_of_mitts/view/widget/shadow_container.dart';
import 'package:extra_set_of_mitts/view/widget/topDivider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: AppStyling().background_image_decoration(),
        child: Scaffold(
            backgroundColor: kTransparentColor,
            appBar: AppStyling().appBarWithHomeButton(context),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppStyling().verticalGap(10),
                TopDivider(),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      MyContainer(
                          marginTop: 20,
                          marginLeft: 20,
                          marginRight: 20,
                          paddingTop: 20,
                          paddingBottom: 20,
                          paddingRight: 20,
                          paddingLeft: 20,
                          widget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                text: 'Settings',
                                weight: FontWeight.w600,
                                size: 16,
                                color: kBlackColor1,
                              ),

                              //  update Unavailability

                              _CustomListTitle(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UnavailabilityScreen(),
                                      ));
                                },
                                marginTop: 20,
                                title: 'Update Unavailability',
                                icon: Assets.imagesCalenderFillBlack,
                              ),

                              // Update Profile Image

                              _CustomListTitle(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UpdateProfileScreen(),
                                      ));
                                },
                                title: 'Update Profile Picture',
                                icon: Assets.imagesProfileSettingIconBlack,
                              ),

                              // Update Location

                              _CustomListTitle(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UpdateAddressScreen(),
                                      ));
                                },
                                title: 'Update Address',
                                icon: Assets.imagesLocationMarkerBlack,
                              ),

                              // WalkThrough Screens

                              _CustomListTitle(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            OnBoardingScreen(),
                                      ));
                                },
                                title: 'View App Walkthrough',
                                icon: Assets.imagesWalkThroughIcon,
                              )
                            ],
                          )),
                    ],
                  ),
                )
              ],
            )

            // )

            ));
  }
}

// Custom List Tile Widget

class _CustomListTitle extends StatelessWidget {
  final String title;
  final String icon;
  final double marginTop;
  final VoidCallback onTap;
  const _CustomListTitle({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.marginTop = 8,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ShadowContainer(
          marginTop: marginTop,
          paddingLeft: 15,
          paddingRight: 15,
          paddingTop: 21,
          paddingBottom: 21,
          widget: Row(
            children: [
              CommonImageView(
                svgPath: icon,
              ),
              Expanded(
                child: MyText(
                  paddingLeft: 10,
                  text: title,
                  weight: FontWeight.w600,
                  size: 16,
                  color: kBlackColor1,
                ),
              ),
              CommonImageView(
                svgPath: Assets.imagesArrowForwardIcon,
              ),
            ],
          )),
    );
  }
}

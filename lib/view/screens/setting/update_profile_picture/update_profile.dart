import 'package:flutter/material.dart';
import 'package:two_local_gals_housekeeping/constants/app_colors.dart';
import 'package:two_local_gals_housekeeping/constants/app_images.dart';
import 'package:two_local_gals_housekeeping/constants/app_styling.dart';
import 'package:two_local_gals_housekeeping/view/screens/setting/setting.dart';
import 'package:two_local_gals_housekeeping/view/widget/back_btn.dart';
import 'package:two_local_gals_housekeeping/view/widget/common_image_view_widget.dart';
import 'package:two_local_gals_housekeeping/view/widget/custom_rectangle_btn.dart';
import 'package:two_local_gals_housekeeping/view/widget/my_container.dart';
import 'package:two_local_gals_housekeeping/view/widget/my_text_widget.dart';
import 'package:two_local_gals_housekeeping/view/widget/topDivider.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
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
                          paddingBottom: 27,
                          paddingRight: 20,
                          paddingLeft: 20,
                          widget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BackBtn(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SettingScreen(),
                                      ));
                                },
                              ),
                              MyText(
                                paddingTop: 22,
                                paddingBottom: 32,
                                text: 'Update Profile Picture',
                                weight: FontWeight.w600,
                                size: 16,
                                color: kBlackColor1,
                              ),

                              // Profile Image

                              Align(
                                alignment: Alignment.center,
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 73),
                                      height: 170,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(22),
                                          border: Border.all(
                                              width: 3,
                                              color: klightBlueColor2)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CommonImageView(
                                          imagePath: Assets.imagesProfileImg2,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    // Add  Image Button

                                    Positioned(
                                        right: 18,
                                        top: 85,
                                        child: InkWell(
                                          onTap: () {},
                                          child: CommonImageView(
                                            svgPath:
                                                Assets.imagesAddRoundBtnIcon,
                                          ),
                                        )),

                                    // Save Button
                                  ],
                                ),
                              ),

                              Row(
                                children: [
                                  Expanded(
                                    child: CustomRectangleBtn(
                                        onPressed: () {},
                                        txt: 'Save',
                                        btnRadius: 8,
                                        backgroundBtnColor: kTertiaryColor),
                                  ),
                                ],
                              ),
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

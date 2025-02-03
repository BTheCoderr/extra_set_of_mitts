// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:two_local_gals_housekeeping/constants/app_colors.dart';
import 'package:two_local_gals_housekeeping/constants/app_images.dart';
import 'package:two_local_gals_housekeeping/constants/app_styling.dart';
import 'package:two_local_gals_housekeeping/view/screens/setting/setting.dart';
import 'package:two_local_gals_housekeeping/view/widget/back_btn.dart';
import 'package:two_local_gals_housekeeping/view/widget/custom_rectangle_btn.dart';
import 'package:two_local_gals_housekeeping/view/widget/custom_textfield.dart';
import 'package:two_local_gals_housekeeping/view/widget/my_container.dart';
import 'package:two_local_gals_housekeeping/view/widget/my_text_widget.dart';
import 'package:two_local_gals_housekeeping/view/widget/topDivider.dart';

class UpdateAddressScreen extends StatefulWidget {
  const UpdateAddressScreen({super.key});

  @override
  State<UpdateAddressScreen> createState() => _UpdateAddressScreenState();
}

class _UpdateAddressScreenState extends State<UpdateAddressScreen> {
  final _controller = TextEditingController();
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
                                paddingBottom: 10,
                                text: 'Update Address',
                                weight: FontWeight.w600,
                                size: 16,
                                color: kBlackColor1,
                              ),

                              // Update Address Fields

                              _AdressFields(
                                controller: _controller,
                                hint: 'Street Address',
                                iconPath: Assets.imagesLocationMarkerGreyIcon1,
                                iconScale: 4,
                              ),
                              _AdressFields(
                                controller: _controller,
                                hint: 'City',
                                iconPath: Assets.imagesCityIcon,
                                iconScale: 2.5,
                              ),
                              _AdressFields(
                                controller: _controller,
                                hint: 'ZIP',
                                iconPath: Assets.imagesZipIcon,
                                iconScale: 2.7,
                              ),

                              AppStyling().verticalGap(43),
                              // Save Button

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

// ignore: must_be_immutable
class _AdressFields extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final String iconPath;
  final String hint;
  final double iconScale;
  final double h;
  _AdressFields({
    super.key,
    required this.controller,
    required this.iconPath,
    required this.hint,
    required this.iconScale,
    this.h = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: h),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        elevation: 4,
        shadowColor: kblackShadowColor,
        child: CustomTextField(
          controller: controller,
          hintText: hint,
          radius: 12,
          prefixIconNeed: true,
          focusedBorderColor: kblackShadowColor,
          prefixIcon: iconPath,
          iconScale: iconScale,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:two_local_gals_housekeeping/constants/app_colors.dart';
import 'package:two_local_gals_housekeeping/constants/app_styling.dart';
import 'package:two_local_gals_housekeeping/view/screens/home/home.dart';
import 'package:two_local_gals_housekeeping/view/widget/check_box_title_widget.dart';
import 'package:two_local_gals_housekeeping/view/widget/custom_rectangle_btn.dart';

import 'package:two_local_gals_housekeeping/view/widget/my_container.dart';
import 'package:two_local_gals_housekeeping/view/widget/my_text_widget.dart';
import 'package:two_local_gals_housekeeping/view/widget/topDivider.dart';

class FinishJobScreen extends StatefulWidget {
  const FinishJobScreen({super.key});

  @override
  State<FinishJobScreen> createState() => _FinishJobScreenState();
}

class _FinishJobScreenState extends State<FinishJobScreen> {
  bool isChecked1 = false;
  final notesController = TextEditingController();

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
                                text: 'Finished Checklist',
                                weight: FontWeight.w600,
                                size: 16,
                                color: kBlackColor1,
                              ),
                              CheckBoxTitleWidget(
                                  topH: 20,
                                  bkColor: kGreyColor7,
                                  isChecked: isChecked1,
                                  text:
                                      'Did you upload all Before/After pics,if applicable?',
                                  onchange: (value) {
                                    isChecked1 = value!;
                                    setState(() {});
                                  }),
                              CheckBoxTitleWidget(
                                  bkColor: kGreyColor7,
                                  isChecked: isChecked1,
                                  text: 'Have you double checked your work?',
                                  onchange: (value) {
                                    isChecked1 = value!;
                                    setState(() {});
                                  }),
                              CheckBoxTitleWidget(
                                  bkColor: kGreyColor7,
                                  isChecked: isChecked1,
                                  text:
                                      'Did the customer do a walkthrough, if possible?',
                                  onchange: (value) {
                                    isChecked1 = value!;
                                    setState(() {});
                                  }),
                              CheckBoxTitleWidget(
                                  bkColor: kGreyColor7,
                                  isChecked: isChecked1,
                                  text:
                                      'Have you double checked your partners work, if you had one?',
                                  onchange: (value) {
                                    isChecked1 = value!;
                                    setState(() {});
                                  }),

                              // Finish Button

                              AppStyling().verticalGap(56),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomRectangleBtn(
                                      onPressed: () {
                                        if (isChecked1 == true) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen(),
                                              ));
                                        } else {}
                                      },
                                      txt: 'Finish Job',
                                      btnRadius: 8,
                                      backgroundBtnColor: (isChecked1 == true)
                                          ? kSecondaryColor
                                          : kGreyColor1,
                                    ),
                                  ),
                                ],
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

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:two_local_gals_housekeeping/constants/app_colors.dart';
import 'package:two_local_gals_housekeeping/constants/app_images.dart';
import 'package:two_local_gals_housekeeping/constants/app_styling.dart';
import 'package:two_local_gals_housekeeping/view/screens/cleaning_completed/cleaning_completed.dart';
import 'package:two_local_gals_housekeeping/view/screens/cleaning_not_completed/cleaning_not_completed.dart';
import 'package:two_local_gals_housekeeping/view/screens/finish_job/finish_job.dart';
import 'package:two_local_gals_housekeeping/view/screens/job/job%20info/job_info.dart';
import 'package:two_local_gals_housekeeping/view/widget/check_box_&_addbtn_card.dart';
import 'package:two_local_gals_housekeeping/view/widget/check_box_title_widget.dart';
import 'package:two_local_gals_housekeeping/view/widget/common_image_view_widget.dart';
import 'package:two_local_gals_housekeeping/view/widget/custom_rectangle_btn.dart';
import 'package:two_local_gals_housekeeping/view/widget/custom_simple_textField.dart';
import 'package:two_local_gals_housekeeping/view/widget/custom_top_card_buttons.dart';
import 'package:two_local_gals_housekeeping/view/widget/my_container.dart';
import 'package:two_local_gals_housekeeping/view/widget/my_text_widget.dart';
import 'package:two_local_gals_housekeeping/view/widget/topDivider.dart';

class JobStartScreen extends StatefulWidget {
  const JobStartScreen({super.key});

  @override
  State<JobStartScreen> createState() => _JobStartScreenState();
}

class _JobStartScreenState extends State<JobStartScreen> {
  bool isChecked1 = true;
  bool isChecked2 = true;
  bool isChecked3 = true;
  bool isChecked4 = true;
  bool isChecked5 = false;
  bool isChecked6 = true;
  bool isChecked7 = false;
  final notesController = TextEditingController();

  Color timerBKColor = kYellowColor2;
  int duration = 3600;
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
                      // Second Container

                      MyContainer(
                          marginTop: 15,
                          marginLeft: 20,
                          marginRight: 20,
                          paddingRight: 20,
                          marginBottom: 19,
                          paddingLeft: 20,
                          paddingTop: 14,
                          paddingBottom: 26,
                          widget: Column(
                            children: [
                              CustomTopCardButtons(
                                  onBackBtnTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => JobInfoScreen(),
                                        ));
                                  },
                                  personName: 'Brad Allen',
                                  status: 'Not Completed',
                                  date: 'Mar 31',
                                  time: '9:30 to 11:00',
                                  onPhoneTap: () {},
                                  onMessageTap: () {}),

                              // Timer

                              Container(
                                margin: EdgeInsets.only(top: 9, bottom: 18),
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: timerBKColor,
                                    shape: BoxShape.circle),
                                child: CircularCountDownTimer(
                                  isReverse: true,
                                  width: 200,
                                  height: 200,
                                  duration: duration,
                                  initialDuration: 0,
                                  fillColor: timerBKColor,
                                  strokeCap: StrokeCap.round,
                                  ringColor: kYellowColor1,

                                  strokeWidth: 5,
                                  backgroundColor: timerBKColor,
                                  textStyle: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w400),

                                  //  controller: ,
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomRectangleBtn(
                                    onPressed: () {},
                                    txt: 'Pause',
                                    btnHeight: 45,
                                    btnWidth: 120,
                                    btnRadius: 8,
                                    borderSideColor: kGreenColor1,
                                    borderStroke: 1,
                                    backgroundBtnColor: kTransparentColor,
                                    txtColor: kBlackColor1,
                                  ),
                                  AppStyling().horizantallGap(20),
                                  CustomRectangleBtn(
                                    onPressed: () {},
                                    txt: 'Start',
                                    btnHeight: 45,
                                    btnWidth: 120,
                                    btnRadius: 8,
                                    backgroundBtnColor: kGreyColor1,
                                  )
                                ],
                              )
                            ],
                          )),

                      // First Container

                      MyContainer(
                          marginLeft: 20,
                          marginRight: 20,
                          paddingTop: 20,
                          paddingBottom: 20,
                          widget:
                              // Main Column with out padding
                              Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // First Column with padding
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: 'Details:',
                                      weight: FontWeight.w600,
                                      size: 16,
                                      color: kBlackColor1,
                                    ),
                                    Wrap(
                                      children: [
                                        MyText(
                                          paddingTop: 5,
                                          text:
                                              "3 Cats and 1 Dog. Dog would be in the office with wife . They’re both working from home. Aren’t looking for a full house clean. We mostly want to have the main living area’s covered, so Kitchen/Dining Room, Living Room,  Bathrooms, NO BEDROOMS/OFFICES. They have a vacuum they’d like you to use, they’ll have it out work for you. ",
                                          weight: FontWeight.w400,
                                          size: 14,
                                          color: kGreyColor2,
                                        ),
                                      ],
                                    ),
                                    MyText(
                                      paddingTop: 20,
                                      text: 'Before/After Pics Required:',
                                      weight: FontWeight.w600,
                                      size: 16,
                                      color: kBlackColor1,
                                    ),
                                    MyText(
                                      paddingTop: 5,
                                      paddingBottom: 20,
                                      text: 'Yes',
                                      weight: FontWeight.w500,
                                      size: 14,
                                      color: klightBlueColor2,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MyText(
                                          text: 'General Clean Items',
                                          weight: FontWeight.w600,
                                          size: 16,
                                          color: kBlackColor1,
                                        ),
                                        MyText(
                                          text: 'Not Completed',
                                          weight: FontWeight.w500,
                                          size: 14,
                                          color: kQuaternaryColor,
                                        ),
                                      ],
                                    ),

                                    //  Check Boxes Buttons

                                    CheckBoxAndAddBtnCard(
                                      topH: 15,
                                      isChecked: isChecked1,
                                      onchange: (value) {},
                                      onAddBtnTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CleaningCompleted(),
                                            ));
                                      },
                                      text: 'Master Bathroom',
                                    ),
                                    CheckBoxAndAddBtnCard(
                                      isChecked: isChecked2,
                                      onchange: (value) {},
                                      onAddBtnTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CleaningNotCompleted(),
                                            ));
                                      },
                                      text: 'Bathroom 2',
                                    ),
                                    CheckBoxAndAddBtnCard(
                                      isChecked: isChecked3,
                                      onchange: (value) {},
                                      onAddBtnTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CleaningNotCompleted(),
                                            ));
                                      },
                                      text: 'Master Bedroom',
                                    ),
                                    CheckBoxAndAddBtnCard(
                                      isChecked: isChecked4,
                                      onchange: (value) {},
                                      onAddBtnTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CleaningNotCompleted(),
                                            ));
                                      },
                                      text: 'Bedroom 2',
                                    ),
                                    CheckBoxAndAddBtnCard(
                                      isChecked: isChecked5,
                                      onchange: (value) {},
                                      onAddBtnTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CleaningNotCompleted(),
                                            ));
                                      },
                                      text: 'Kitchen',
                                    ),
                                    CheckBoxAndAddBtnCard(
                                      isChecked: isChecked6,
                                      onchange: (value) {},
                                      onAddBtnTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CleaningNotCompleted(),
                                            ));
                                      },
                                      text: 'Other Rooms',
                                    ),
                                    AppStyling().verticalGap(20),

                                    // Deep Clean Items

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MyText(
                                          text: 'Deep Clean Items',
                                          weight: FontWeight.w600,
                                          size: 16,
                                          color: kBlackColor1,
                                        ),
                                        MyText(
                                          text: 'Not Completed',
                                          weight: FontWeight.w500,
                                          size: 14,
                                          color: kQuaternaryColor,
                                        ),
                                      ],
                                    ),

                                    // CheckBoxes

                                    CheckBoxTitleWidget(
                                        topH: 15,
                                        isChecked: isChecked7,
                                        text: 'Kitchen Cupboard (Outside only)',
                                        onchange: (value) {}),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked7,
                                        text: 'Bath Cupboards (Outside only)',
                                        onchange: (value) {}),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked7,
                                        text: 'Inside Oven',
                                        onchange: (value) {}),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked7,
                                        text: 'Fridge/Freezer',
                                        onchange: (value) {}),
                                    AppStyling().verticalGap(30),
                                  ],
                                ),
                              ),

                              TopDivider(
                                clr: kGreyColor4,
                              ),

                              // Second Column with Padding

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: 'Notes',
                                      weight: FontWeight.w600,
                                      size: 16,
                                      color: kBlackColor1,
                                    ),
                                    AppStyling().verticalGap(15),
                                    CustomSimpleTextField(
                                      txtController: notesController,
                                      hintText: 'Type Here....',
                                      filled: true,
                                      maxLines: 5,
                                      contentPaddingTop: 10,
                                    ),
                                    AppStyling().verticalGap(20),
                                    MyText(
                                      text: 'Upload Pictures',
                                      weight: FontWeight.w600,
                                      size: 16,
                                      color: kBlackColor1,
                                    ),
                                    AppStyling().verticalGap(15),
                                    Align(
                                      alignment: Alignment.center,
                                      child: CommonImageView(
                                        imagePath: Assets.imagesUploadImg,
                                        height: 170.81,
                                        width: 210,
                                      ),
                                    ),
                                    AppStyling().verticalGap(25),

                                    // Upload Image Button

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomRectangleBtn(
                                            onPressed: () {},
                                            btnHeight: 43,
                                            btnWidth: 140,
                                            txt: 'Upload',
                                            btnRadius: 8,
                                            backgroundBtnColor: kTertiaryColor),
                                      ],
                                    ),
                                    AppStyling().verticalGap(85),

                                    // Next Button

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
                                                          FinishJobScreen(),
                                                    ));
                                              } else {}
                                            },
                                            txt: 'Next',
                                            btnRadius: 8,
                                            backgroundBtnColor:
                                                (isChecked1 == true)
                                                    ? kSecondaryColor
                                                    : kGreyColor1,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
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

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:two_local_gals_housekeeping/constants/app_colors.dart';
import 'package:two_local_gals_housekeeping/constants/app_styling.dart';
import 'package:two_local_gals_housekeeping/view/screens/job/job%20start/job_start.dart';
import 'package:two_local_gals_housekeeping/view/widget/check_box_title_widget.dart';
import 'package:two_local_gals_housekeeping/view/widget/custom_rectangle_btn.dart';
import 'package:two_local_gals_housekeeping/view/widget/custom_top_card_buttons.dart';
import 'package:two_local_gals_housekeeping/view/widget/my_container.dart';
import 'package:two_local_gals_housekeeping/view/widget/my_text_widget.dart';
import 'package:two_local_gals_housekeeping/view/widget/topDivider.dart';

class CleaningNotCompleted extends StatefulWidget {
  const CleaningNotCompleted({super.key});

  @override
  State<CleaningNotCompleted> createState() => _CleaningNotCompletedState();
}

class _CleaningNotCompletedState extends State<CleaningNotCompleted> {
  bool isChecked1 = false;
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
                      // First Container

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
                                          builder: (context) =>
                                              JobStartScreen(),
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
                                    // Deep Clean Items

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MyText(
                                          text: 'Kitchen',
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
                                        topH: 23,
                                        isChecked: isChecked1,
                                        text: 'Take Before/After Pictures',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),

                                    CheckBoxTitleWidget(
                                        topH: 23,
                                        isChecked: isChecked1,
                                        text:
                                            'General dusting and remove cobwebs',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text:
                                            'Damp wipe countertops  & cloth dry',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text: 'Clean outsides of range hood',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text:
                                            'Clean top/front of range and fridge',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    //---------------
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text:
                                            'Clean top/front of all appliances',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text: 'Wipe out Microwave',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text:
                                            'Do any dishes or place in dishwasher',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text: 'Clean/disinfect sink',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text: 'Dry/polish fixtures',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text: 'Empty garbage and replace liner',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text: 'Sweep/vacuum any hard flooring',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text: 'Mop any hard flooring',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    AppStyling().verticalGap(20),
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
                                    CheckBoxTitleWidget(
                                        topH: 20,
                                        isChecked: isChecked1,
                                        text:
                                            'Kitchen cupboards (Outside only)',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text: 'Bath cupboards (Outside only)',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text: 'Inside Oven',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text: 'Inside Fridge/Freezer',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    AppStyling().verticalGap(30),
                                  ],
                                ),
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

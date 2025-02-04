import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:extra_set_of_mitts/constants/app_colors.dart';
import 'package:extra_set_of_mitts/constants/app_styling.dart';
import 'package:extra_set_of_mitts/view/screens/job/job%20start/job_start.dart';
import 'package:extra_set_of_mitts/view/widget/check_box_title_widget.dart';
import 'package:extra_set_of_mitts/view/widget/custom_rectangle_btn.dart';
import 'package:extra_set_of_mitts/view/widget/custom_top_card_buttons.dart';
import 'package:extra_set_of_mitts/view/widget/my_container.dart';
import 'package:extra_set_of_mitts/view/widget/my_text_widget.dart';
import 'package:extra_set_of_mitts/view/widget/topDivider.dart';

class CleaningCompleted extends StatefulWidget {
  const CleaningCompleted({super.key});

  @override
  State<CleaningCompleted> createState() => _CleaningCompletedState();
}

class _CleaningCompletedState extends State<CleaningCompleted> {
  bool isChecked1 = true;
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
                                        fontWeight: FontWeight.w400)

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
                                          text: 'Master Bathroom',
                                          weight: FontWeight.w600,
                                          size: 16,
                                          color: kBlackColor1,
                                        ),
                                        MyText(
                                          text: 'Completed',
                                          weight: FontWeight.w500,
                                          size: 14,
                                          color: kGreenColor1,
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
                                        isChecked: isChecked1,
                                        text: 'General dusting',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text:
                                            'Title Walls/Bathtubs/Showers cleaned',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text: 'Mirrors/Chrome fixtures /Shined',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    //---------------
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text: 'Floors washed and disinfacted',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text: 'Carpets vacuumed',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text: 'Shake rugs outside',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text:
                                            'Toilet cleaned/disinfected inside/ou',
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
                                        text: 'Tidy towels',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text: 'Clean window sills',
                                        onchange: (value) {
                                          isChecked1 = value!;
                                          setState(() {});
                                        }),
                                    CheckBoxTitleWidget(
                                        isChecked: isChecked1,
                                        text: 'Clean baseboards',
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

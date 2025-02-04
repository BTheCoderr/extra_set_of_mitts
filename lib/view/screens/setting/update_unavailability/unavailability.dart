import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:extra_set_of_mitts/constants/app_colors.dart';
import 'package:extra_set_of_mitts/constants/app_images.dart';
import 'package:extra_set_of_mitts/constants/app_styling.dart';
import 'package:extra_set_of_mitts/view/screens/setting/setting.dart';
import 'package:extra_set_of_mitts/view/widget/back_btn.dart';
import 'package:extra_set_of_mitts/view/widget/custom_drop_down.dart';
import 'package:extra_set_of_mitts/view/widget/custom_rectangle_btn.dart';
import 'package:extra_set_of_mitts/view/widget/custom_textfield.dart';
import 'package:extra_set_of_mitts/view/widget/my_container.dart';
import 'package:extra_set_of_mitts/view/widget/my_text_widget.dart';
import 'package:extra_set_of_mitts/view/widget/topDivider.dart';

class UnavailabilityScreen extends StatefulWidget {
  const UnavailabilityScreen({super.key});

  @override
  State<UnavailabilityScreen> createState() => _UnavailabilityScreenState();
}

class _UnavailabilityScreenState extends State<UnavailabilityScreen> {
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
                          // Main Column

                          widget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),

                                // First  Data Column

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BackBtn(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SettingScreen(),
                                            ));
                                      },
                                    ),
                                    MyText(
                                      paddingTop: 22,
                                      paddingBottom: 10,
                                      text: 'Update Unavailability',
                                      weight: FontWeight.w600,
                                      size: 16,
                                      color: kBlackColor1,
                                    ),

                                    // Calender with Custom Header

                                    _Calender(),
                                  ],
                                ),
                              ),

                              TopDivider(
                                clr: kGreyColor4,
                              ),

                              // Second Data Column
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      paddingTop: 25,
                                      paddingBottom: 5,
                                      text: 'Start time',
                                      weight: FontWeight.w600,
                                      size: 14,
                                      color: kBlackColor1,
                                    ),

                                    _CustomTextFormFields(
                                      controller: _controller,
                                      hint: '00 / 00 / AM',
                                    ),

                                    MyText(
                                      paddingTop: 15,
                                      paddingBottom: 5,
                                      text: 'End time',
                                      weight: FontWeight.w600,
                                      size: 14,
                                      color: kBlackColor1,
                                    ),

                                    _CustomTextFormFields(
                                      h: 15,
                                      controller: _controller,
                                      hint: '00 / 00 / AM',
                                    ),

                                    MyText(
                                      paddingTop: 20,
                                      paddingBottom: 5,
                                      text: 'Recurrence',
                                      weight: FontWeight.w600,
                                      size: 14,
                                      color: kBlackColor1,
                                    ),

                                    CustomDropDown(
                                      hint: 'None',
                                      items: [
                                        '10:30 AM',
                                        '11:00 AM',
                                        '12:00 PM'
                                      ],
                                      onChanged: (value) {},
                                    ),

                                    AppStyling().verticalGap(37),
                                    // Save Button

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: CustomRectangleBtn(
                                            onPressed: () {},
                                            txt: 'Delete',
                                            btnHeight: 45,
                                            btnWidth: 120,
                                            btnRadius: 8,
                                            borderSideColor: kTertiaryColor,
                                            borderStroke: 1,
                                            backgroundBtnColor:
                                                kTransparentColor,
                                            txtColor: kBlackColor1,
                                          ),
                                        ),
                                        AppStyling().horizantallGap(20),
                                        Expanded(
                                          child: CustomRectangleBtn(
                                            onPressed: () {},
                                            txt: 'Save',
                                            btnHeight: 45,
                                            btnWidth: 120,
                                            btnRadius: 8,
                                            backgroundBtnColor: kTertiaryColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      AppStyling().verticalGap(37),
                    ],
                  ),
                )
              ],
            )

            // )

            ));
  }
}

// Private Calender Class

class _Calender extends StatefulWidget {
  const _Calender({super.key});

  @override
  State<_Calender> createState() => _CalenderState();
}

class _CalenderState extends State<_Calender> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      //height: 380,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Month Name and Year

              Row(
                children: [
                  // Month name

                  MyText(
                    text: DateFormat.MMMM().format(_focusedDay),
                    weight: FontWeight.w700,
                    size: 14,
                    color: kBlackColor1,
                  ),

                  // Year
                  MyText(
                    paddingLeft: 10,
                    text: DateFormat.y().format(_focusedDay),
                    weight: FontWeight.w700,
                    size: 14,
                    color: kBlackColor1,
                  ),
                ],
              ),

              // Next and previous Buttons

              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 15,
                    ),
                    onPressed: () {
                      setState(() {
                        _focusedDay = DateTime(_focusedDay.year,
                            _focusedDay.month - 1, _focusedDay.day);
                      });
                    },
                  ),
                  // AppStyling().horizantallGap(9.47),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                    ),
                    onPressed: () {
                      setState(() {
                        _focusedDay = DateTime(_focusedDay.year,
                            _focusedDay.month + 1, _focusedDay.day);
                      });
                    },
                  ),
                ],
              )
            ],
          ),

          // Table Calender

          TableCalendar(
            headerVisible: false,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            //daysOfWeekVisible: true,
            weekNumbersVisible: false,
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekStyle: DaysOfWeekStyle(),

            // Calender Decoration

            calendarStyle: CalendarStyle(
              todayDecoration:
                  BoxDecoration(color: kRedColor3, shape: BoxShape.circle),
              markerDecoration:
                  BoxDecoration(color: kRedColor3, shape: BoxShape.rectangle),
              outsideDaysVisible: false,
              tablePadding: EdgeInsets.zero,
              defaultTextStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable, unused_element
class _CustomTextFormFields extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  final String hint;

  final double h;
  _CustomTextFormFields({
    super.key,
    required this.controller,
    required this.hint,
    this.h = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: h),
      child: CustomTextField(
        contentPaddingLeft: 20,
        controller: controller,
        hintText: hint,
        radius: 12,
        focusedBorderColor: kblackShadowColor,
        suffixIcon: Image.asset(
          Assets.imagesClockIcon2,
          scale: 2.7,
          color: kTertiaryColor,
        ),
        filled: true,
        backgroundColor: kGreyColor5,
      ),
      //),
    );
  }
}

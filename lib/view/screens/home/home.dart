import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extra_set_of_mitts/config/routes/routes.dart';
import 'package:extra_set_of_mitts/constants/app_colors.dart';
import 'package:extra_set_of_mitts/constants/app_images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:extra_set_of_mitts/constants/app_styling.dart';
import 'package:extra_set_of_mitts/view/screens/job/job info/job_info.dart';
import 'package:extra_set_of_mitts/view/screens/location/location.dart';
import 'package:extra_set_of_mitts/view/screens/setting/setting.dart';
import 'package:extra_set_of_mitts/view/widget/common_image_view_widget.dart';
import 'package:extra_set_of_mitts/view/widget/my_container.dart';
import 'package:extra_set_of_mitts/view/widget/my_text_widget.dart';
import 'package:extra_set_of_mitts/view/widget/topDivider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _isSelectedIcon = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: AppStyling().background_image_decoration(),
        child: Scaffold(
            backgroundColor: kTransparentColor,
            appBar: AppStyling().appBarWithSettingButton(onTap: () => Get.to(() => SettingScreen())),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppStyling().verticalGap(10),
                TopDivider(),
                MyText(
                  paddingTop: 15,
                  paddingLeft: 20,
                  paddingRight: 20,
                  text: 'Good Morning Carly!',
                  weight: FontWeight.w600,
                  size: 20,
                  color: kHalfWhiteColor,
                ),
                AppStyling().verticalGap(15),
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      MyContainer(
                          marginLeft: 20,
                          marginRight: 20,
                          paddingTop: 30,
                          paddingBottom: 38,
                          paddingRight: 30,
                          paddingLeft: 10,
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _HeadingsColumn(
                                  heading1: 'Hours',
                                  heading2: 'Pay',
                                  heading3: 'Hourly Rate'),
                              _EarningCard(
                                daysTitle: 'Today',
                                icon: Assets.imagesCalenderFillIcon,
                                heading1: '6.5',
                                heading2: '\$209',
                                heading3: '\$27.26',
                              ),
                              _EarningCard(
                                daysTitle: 'This Week',
                                icon: Assets.imagesBalanceIcon,
                                heading1: '6.5',
                                heading2: '\$209',
                                heading3: '\$27.26',
                              ),
                              _EarningCard(
                                daysTitle: 'Next Week',
                                icon: Assets.imagesWalletIcon,
                                heading1: '6.5',
                                heading2: '\$209',
                                heading3: '\$27.26',
                              )
                            ],
                          )),
                      AppStyling().verticalGap(25),
                      MyText(
                        paddingLeft: 20,
                        text: 'Schedule',
                        weight: FontWeight.w600,
                        size: 20,
                        color: kHalfWhiteColor,
                      ),
                      AppStyling().verticalGap(15),
                      _DecorationContain2(
                        rTL: 20,
                        rTR: 20,
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: MyText(
                                paddingLeft: 12,
                                text: 'Mar 30',
                                weight: FontWeight.w500,
                                size: 16,
                                color: kGreyColor2,
                              ),
                            ),
                            MyText(
                              text: 'Approx. Pay: ',
                              weight: FontWeight.w500,
                              size: 16,
                              color: kGreyColor2,
                            ),
                            MyText(
                              paddingRight: 12,
                              text: '\$209',
                              weight: FontWeight.w500,
                              size: 16,
                              color: kRedColor2,
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return _DetailsItems(
                              startTime: '11:30 AM',
                              endTime: '2:30 PM',
                              totalHourse: '3',
                              personName: 'Brad Alien',
                              personLocation: 'Salt lake City',
                              scheduleTime: "12.5 ml. (20min)",
                              isSelectedIndex: _selectedIndex,
                              index: index,
                              bkColor: (index == _selectedIndex)
                                  ? kSplashColor
                                  : kPrimaryColor,
                              onTap: () => Get.toNamed(AppLinks.jobInfo),
                              locationOnTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LocationScreen()));
                              },
                            );
                          }),
                      _DecorationContain2(
                          rBL: 20,
                          rBR: 20,
                          widget: SizedBox(
                            height: 1,
                          ))
                    ],
                  ),
                ),
              ],
            )

            // )

            ));
  }
}

class _DetailsItems extends StatelessWidget {
  final String startTime,
      endTime,
      totalHourse,
      personName,
      personLocation,
      scheduleTime;
  final bkColor;
  final int isSelectedIndex;
  final int index;

  final VoidCallback onTap;
  final VoidCallback locationOnTap;
  const _DetailsItems({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.totalHourse,
    required this.personName,
    required this.personLocation,
    required this.scheduleTime,
    required this.onTap,
    this.bkColor = kPrimaryColor,
    this.isSelectedIndex = 0,
    this.index = 0,
    required this.locationOnTap,
  });

  // int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                  top: 20,
                  left: 0,
                  child: (isSelectedIndex == index)
                      ? CommonImageView(
                          height: 23,
                          width: 20,
                          imagePath: Assets.imagesKeyBtnIcon,
                        )
                      : SizedBox()),
              Positioned(
                  top: 20,
                  right: 0,
                  child: (isSelectedIndex == index)
                      ? GestureDetector(
                          onTap: locationOnTap,
                          child: CommonImageView(
                            height: 23,
                            imagePath: Assets.imagesSendBtnIcon,
                          ),
                        )
                      : SizedBox()),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                    decoration: BoxDecoration(
                        color: //(currentIndex == index)
                            //? kSplashColor
                            // :
                            bkColor,
                        boxShadow: [
                          BoxShadow(
                              color: kBlackColor1.withOpacity(.08),
                              blurRadius: 20,
                              spreadRadius: 0,
                              offset: Offset(0, 10))
                        ]),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            MyText(
                              paddingLeft: 12,
                              text: 'Start',
                              weight: FontWeight.w500,
                              size: 14,
                              color: kTertiaryColor,
                            ),
                            MyText(
                              paddingLeft: 15,
                              text: startTime,
                              weight: FontWeight.w500,
                              size: 12,
                              color: kBlackColor1,
                            ),
                            MyText(
                              paddingLeft: 25,
                              text: 'End',
                              weight: FontWeight.w500,
                              size: 14,
                              color: kTertiaryColor,
                            ),
                            MyText(
                              paddingLeft: 15,
                              text: endTime,
                              weight: FontWeight.w500,
                              size: 12,
                              color: kBlackColor1,
                            ),
                            MyText(
                              paddingLeft: 25,
                              text: 'Hrs ',
                              weight: FontWeight.w500,
                              size: 14,
                              color: kTertiaryColor,
                            ),
                            MyText(
                              paddingLeft: 15,
                              text: totalHourse,
                              weight: FontWeight.w500,
                              size: 12,
                              color: kBlackColor1,
                            ),
                          ],
                        ),
                        AppStyling().verticalGap(17),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              paddingRight: 4.38,
                              text: 'Customer ',
                              weight: FontWeight.w500,
                              size: 12,
                              color: kTertiaryColor,
                            ),
                            Expanded(
                              child: CommonImageView(
                                imagePath: Assets.imagesPersonIcon,
                                height: 12,
                                width: 9,
                              ),
                            ),
                            MyText(
                              paddingLeft: 5.31,
                              paddingRight: 6,
                              text: personName,
                              weight: FontWeight.w500,
                              size: 12,
                              color: kGreyColor1,
                            ),
                            Icon(
                              Icons.circle,
                              size: 3,
                              color: kGreyColor2,
                            ),
                            AppStyling().horizantallGap(5),
                            Expanded(
                              child: CommonImageView(
                                svgPath: Assets.imagesLocationMarkerIcon,
                              ),
                            ),
                            MyText(
                              paddingLeft: 5.31,
                              paddingRight: 3,
                              text: personLocation,
                              weight: FontWeight.w500,
                              size: 12,
                              color: kGreyColor1,
                            ),
                            Icon(
                              Icons.circle,
                              size: 3,
                              color: kGreyColor2,
                            ),
                            AppStyling().horizantallGap(5),
                            Expanded(
                              child: CommonImageView(
                                svgPath: Assets.imagesClockIcon,
                              ),
                            ),
                            MyText(
                              paddingLeft: 5.31,
                              text: scheduleTime,
                              weight: FontWeight.w500,
                              size: 12,
                              color: kGreyColor1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 10,
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: DottedLine(
                            lineThickness: 1,
                            lineLength: double.infinity,
                            dashColor: kGreyColor3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
          //},
          //),
        ],
      ),
    );
  }
}

// Private class
// ignore: must_be_immutable
class _EarningCard extends StatelessWidget {
  String icon;
  String heading1, heading2, heading3;

  String daysTitle;
  _EarningCard({
    super.key,
    required this.icon,
    required this.daysTitle,
    required this.heading1,
    required this.heading2,
    required this.heading3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MyText(
          text: daysTitle,
          weight: FontWeight.w500,
          size: 14,
          color: kGreyColor2,
        ),
        AppStyling().verticalGap(15),
        CommonImageView(
          imagePath: icon,
          height: 60,
          width: 60,
        ),
        AppStyling().verticalGap(35),
        MyText(
          text: heading1,
          weight: FontWeight.w500,
          size: 14,
          color: kBlackColor1,
        ),
        AppStyling().verticalGap(20),
        MyText(
          text: heading2,
          weight: FontWeight.w500,
          size: 14,
          color: kBlackColor1,
        ),
        AppStyling().verticalGap(20),
        MyText(
          text: heading3,
          weight: FontWeight.w500,
          size: 14,
          color: kBlackColor1,
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class _HeadingsColumn extends StatelessWidget {
  String heading1, heading2, heading3;

  _HeadingsColumn({
    required this.heading1,
    required this.heading2,
    required this.heading3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        MyText(
          text: '',
          weight: FontWeight.w500,
          size: 14,
          color: kGreyColor2,
        ),
        AppStyling().verticalGap(15),
        CommonImageView(
          imagePath: Assets.imagesCalenderFillIcon,
          height: 60,
          width: 60,
          color: kPrimaryColor,
        ),
        AppStyling().verticalGap(35),
        MyText(
          text: heading1,
          weight: FontWeight.w500,
          size: 12,
          color: kTertiaryColor,
        ),
        AppStyling().verticalGap(22),
        MyText(
          text: heading2,
          weight: FontWeight.w500,
          size: 12,
          color: kTertiaryColor,
        ),
        AppStyling().verticalGap(23),
        MyText(
          text: heading3,
          weight: FontWeight.w500,
          size: 12,
          color: kTertiaryColor,
        ),
      ],
    );
  }
}

class _DecorationContain2 extends StatelessWidget {
  final Widget widget;
  final double rTL, rTR, rBL, rBR;
  const _DecorationContain2(
      {super.key,
      required this.widget,
      this.rTL = 0,
      this.rTR = 0,
      this.rBL = 0,
      this.rBR = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(rTL),
              topRight: Radius.circular(rTR),
              bottomLeft: Radius.circular(rBL),
              bottomRight: Radius.circular(rBR)),
          boxShadow: [
            BoxShadow(
                color: kBlackColor1.withOpacity(.08),
                blurRadius: 20,
                spreadRadius: 0,
                offset: Offset(0, 10))
          ]),
      child: widget,
    );
  }
}

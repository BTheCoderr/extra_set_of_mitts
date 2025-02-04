import 'package:extra_set_of_mitts/constants/app_colors.dart';
import 'package:extra_set_of_mitts/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:extra_set_of_mitts/constants/app_styling.dart';
import 'package:extra_set_of_mitts/view/screens/job/job start/job_start.dart';
import 'package:extra_set_of_mitts/view/widget/checkbox_widget.dart';
import 'package:extra_set_of_mitts/view/widget/common_image_view_widget.dart';
import 'package:extra_set_of_mitts/view/widget/custom_rectangle_btn.dart';
import 'package:get/get.dart';
import 'package:extra_set_of_mitts/view/widget/custom_top_card_buttons.dart';
import 'package:extra_set_of_mitts/view/widget/my_container.dart';
import 'package:extra_set_of_mitts/view/widget/my_text_widget.dart';
import 'package:extra_set_of_mitts/view/widget/shadow_container.dart';
import 'package:extra_set_of_mitts/view/widget/topDivider.dart';

class JobInfoScreen extends StatefulWidget {
  const JobInfoScreen({super.key});

  @override
  State<JobInfoScreen> createState() => _JobInfoScreenState();
}

class _JobInfoScreenState extends State<JobInfoScreen> {
  bool isChecked1 = false;
  bool isChecked2 = false;

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
                child: MyContainer(
                    marginTop: 15,
                    marginLeft: 20,
                    marginRight: 20,
                    paddingTop: 13,
                    paddingBottom: 38,
                    widget: ListView(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        // First Container

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              CustomTopCardButtons(
                                onBackBtnTap: () {},
                                backButton: false,
                                onMessageTap: () {},
                                onPhoneTap: () {},
                                status: 'Not Completed',
                                personName: 'Bard Allen',
                                date: 'Mar 31',
                                time: '9:30 To 11:00',
                              ),
                              AppStyling().verticalGap(15),
                              Row(
                                children: [
                                  MyText(
                                    text: 'Address: ',
                                    weight: FontWeight.w400,
                                    size: 16,
                                    color: kBlackColor1,
                                  ),
                                  Expanded(
                                    child: MyText(
                                      text: '2846  Branch Dr, SLC',
                                      weight: FontWeight.w400,
                                      size: 16,
                                      color: kGreyColor2,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: CommonImageView(
                                        imagePath: Assets.imagesSendIcon2,
                                        height: 40,
                                        width: 40,
                                      ))
                                ],
                              ),
                              AppStyling().verticalGap(15),
                              Row(
                                children: [
                                  MyText(
                                    text: 'Partners(s): ',
                                    weight: FontWeight.w500,
                                    size: 16,
                                    color: kBlackColor1,
                                  ),
                                  Expanded(
                                    child: MyText(
                                      text: 'Kimber Stovall',
                                      weight: FontWeight.w400,
                                      size: 16,
                                      color: kGreyColor2,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: CommonImageView(
                                      svgPath: Assets.imagesCallAddIcon,
                                    ),
                                  ),
                                  AppStyling().horizantallGap(15),
                                  InkWell(
                                    onTap: () {},
                                    child: CommonImageView(
                                      svgPath: Assets.imagesMessageIcon,
                                    ),
                                  ),
                                ],
                              ),
                              AppStyling().verticalGap(11),
                              Row(
                                children: [
                                  MyText(
                                    text: 'Approx. Pay: ',
                                    weight: FontWeight.w500,
                                    size: 16,
                                    color: kBlackColor1,
                                  ),
                                  MyText(
                                    text: '\$60.70',
                                    weight: FontWeight.w400,
                                    size: 16,
                                    color: kRedColor2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        AppStyling().verticalGap(20),
                        TopDivider(
                          clr: kGreyColor4,
                        ),
                        AppStyling().verticalGap(20),

                        // Second Container

                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Building Information Row -------

                              Row(
                                children: [
                                  MyText(
                                    text: 'Building Information: ',
                                    weight: FontWeight.w700,
                                    size: 16,
                                    color: kBlackColor1,
                                  ),
                                  MyText(
                                    text: '(Take Keys)',
                                    weight: FontWeight.w600,
                                    size: 16,
                                    color: kDarkBlueColor1,
                                  ),
                                ],
                              ),
                              AppStyling().verticalGap(5),

                              Wrap(
                                children: [
                                  MyText(
                                    text:
                                        "SF(2000), Beds(2), Baths(2), Take Vacuum Pets(+3),Clean Rating(5), Flooring(Carpet, Hardwood) ",
                                    weight: FontWeight.w400,
                                    size: 14,
                                    color: kGreyColor2,
                                  ),
                                ],
                              ),

                              MyText(
                                paddingTop: 15,
                                text: 'Cleaning Types:',
                                weight: FontWeight.w600,
                                size: 16,
                                color: kBlackColor1,
                              ),
                              MyText(
                                paddingTop: 5,
                                paddingBottom: 15,
                                text: 'General Clean Plus',
                                weight: FontWeight.w400,
                                size: 14,
                                color: kGreyColor2,
                              ),
                              MyText(
                                paddingTop: 15,
                                paddingBottom: 5,
                                text: 'Deep Cleaning Items',
                                weight: FontWeight.w600,
                                size: 16,
                                color: kBlackColor1,
                              ),
                              MyText(
                                paddingBottom: 5,
                                text: '1. Kitch Cupboards (Outsides) Only',
                                weight: FontWeight.w400,
                                size: 14,
                                color: kGreyColor2,
                              ),
                              MyText(
                                paddingBottom: 5,
                                text: '2. Bath Cupboards (Outsides) Only',
                                weight: FontWeight.w400,
                                size: 14,
                                color: kGreyColor2,
                              ),
                              MyText(
                                paddingBottom: 5,
                                text: '3. Oven',
                                weight: FontWeight.w400,
                                size: 14,
                                color: kGreyColor2,
                              ),
                              MyText(
                                paddingBottom: 5,
                                text: '4. Refrigerators',
                                weight: FontWeight.w400,
                                size: 14,
                                color: kGreyColor2,
                              ),
                            ],
                          ),
                        ),
                        TopDivider(
                          clr: kGreyColor4,
                        ),

                        // 3rd Container

                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Building Information Row -------

                              MyText(
                                paddingTop: 20,
                                paddingBottom: 5,
                                text: 'Details:',
                                weight: FontWeight.w600,
                                size: 16,
                                color: kBlackColor1,
                              ),

                              Wrap(
                                children: [
                                  MyText(
                                    text:
                                        "SF(2000), Beds(2), Baths(2), Take Vacuum Pets(+3),Clean Rating(5), Flooring(Carpet, Hardwood) ",
                                    weight: FontWeight.w400,
                                    size: 14,
                                    color: kGreyColor2,
                                  ),
                                ],
                              ),

                              MyText(
                                paddingTop: 20,
                                text: 'Payment Type:',
                                weight: FontWeight.w600,
                                size: 16,
                                color: kBlackColor1,
                              ),
                              MyText(
                                paddingTop: 5,
                                paddingBottom: 15,
                                text: 'Check (Collect \$170)',
                                weight: FontWeight.w500,
                                size: 14,
                                color: klightBlueColor2,
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
                                text: 'Yes',
                                weight: FontWeight.w500,
                                size: 14,
                                color: klightBlueColor2,
                              ),
                            ],
                          ),
                        ),
                        TopDivider(
                          clr: kGreyColor4,
                        ),

                        AppStyling().verticalGap(20),

                        // checkBox 1

                        _TextAndCheckBoxCard(
                          onchange: (value) {
                            isChecked1 = value!;
                            setState(() {});
                          },
                          isChecked: isChecked1,
                          text:
                              "All needed supplies have been brought into the property",
                        ),
                        AppStyling().verticalGap(15),

                        // checkBox 2

                        _TextAndCheckBoxCard(
                          onchange: (value) {
                            isChecked2 = value!;
                            setState(() {});
                          },
                          isChecked: isChecked2,
                          text: "All details have been read",
                        ),

                        AppStyling().verticalGap(40),

                        // Start Job Button.....

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: CustomRectangleBtn(
                            onPressed: () {
                              if (isChecked1 == true && isChecked2 == true) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => JobStartScreen(),
                                    ));
                              } else {}
                            },
                            txt: 'Start job',
                            btnRadius: 8,
                            backgroundBtnColor:
                                (isChecked1 == true && isChecked2 == true)
                                    ? kSecondaryColor
                                    : kGreyColor1,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),

          // )
        ));
  }
}

class _TextAndCheckBoxCard extends StatelessWidget {
  final bool isChecked;
  final Function(bool?)? onchange;
  final String text;
  const _TextAndCheckBoxCard({
    super.key,
    this.isChecked = false,
    required this.onchange,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 12, bottom: 12, right: 10, left: 10),
      decoration: BoxDecoration(
          color: kGreyColor5, borderRadius: BorderRadius.circular(12)),
      child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: MyText(
                text: text,
                weight: FontWeight.w500,
                size: 14,
                color: kGreyColor2,
              ),
            ),
            CheckBoxWidget(
              onChanged: onchange,
              isChecked: isChecked,
            ),
          ]),
    );
  }
}

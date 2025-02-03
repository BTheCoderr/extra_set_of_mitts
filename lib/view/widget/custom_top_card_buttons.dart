import 'package:flutter/material.dart';
import 'package:two_local_gals_housekeeping/constants/app_colors.dart';
import 'package:two_local_gals_housekeeping/constants/app_images.dart';
import 'package:two_local_gals_housekeeping/constants/app_styling.dart';
import 'package:two_local_gals_housekeeping/view/widget/common_image_view_widget.dart';
import 'package:two_local_gals_housekeeping/view/widget/my_text_widget.dart';

// ignore: must_be_immutable
class CustomTopCardButtons extends StatelessWidget {
  String personName, status, date, time, emptyString;
  bool backButton;
  VoidCallback? onPhoneTap, onMessageTap, onBackBtnTap;
  CustomTopCardButtons({
    super.key,
    required this.personName,
    required this.status,
    required this.date,
    required this.time,
    this.emptyString = '',
    this.backButton = true,
    required this.onPhoneTap,
    required this.onMessageTap,
    this.onBackBtnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (backButton == true)
                ? InkWell(
                    onTap: onBackBtnTap,
                    child: CommonImageView(
                      imagePath: Assets.imagesBackArrowIcon,
                      height: 11.17,
                      width: 17.58,
                    ),
                  )
                : MyText(
                    text: '',
                    weight: FontWeight.w700,
                    size: 18,
                    color: kQuaternaryColor,
                  ),
            MyText(
              text: status,
              weight: FontWeight.w700,
              size: 18,
              color: kQuaternaryColor,
            ),
          ],
        ),
        AppStyling().verticalGap(14),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: MyText(
                text: personName,
                weight: FontWeight.w700,
                size: 24,
                color: kBlackColor1,
              ),
            ),
            InkWell(
              onTap: onPhoneTap,
              child: CommonImageView(
                svgPath: Assets.imagesCallAddIcon,
              ),
            ),
            AppStyling().horizantallGap(15),
            InkWell(
              onTap: onMessageTap,
              child: CommonImageView(
                svgPath: Assets.imagesMessageIcon,
              ),
            ),
          ],
        ),
        AppStyling().verticalGap(22),
        Row(
          children: [
            CommonImageView(
              imagePath: Assets.imagesCalenderIcon,
              height: 14.63,
              width: 13.5,
            ),
            MyText(
              paddingLeft: 15,
              text: date,
              weight: FontWeight.w500,
              size: 16,
              color: kGreyColor2,
            ),
          ],
        ),
        AppStyling().verticalGap(15),
        Row(
          children: [
            CommonImageView(
              svgPath: Assets.imagesClockIcon,
            ),
            MyText(
              paddingLeft: 15,
              text: time,
              weight: FontWeight.w500,
              size: 16,
              color: kGreyColor2,
            ),
          ],
        )
      ],
    );
  }
}

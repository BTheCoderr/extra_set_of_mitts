import 'package:flutter/material.dart';
import 'package:two_local_gals_housekeeping/constants/app_colors.dart';
import 'package:two_local_gals_housekeeping/constants/app_images.dart';
import 'package:two_local_gals_housekeeping/constants/app_styling.dart';
import 'package:two_local_gals_housekeeping/view/widget/checkbox_widget.dart';
import 'package:two_local_gals_housekeeping/view/widget/common_image_view_widget.dart';
import 'package:two_local_gals_housekeeping/view/widget/my_text_widget.dart';

class CheckBoxAndAddBtnCard extends StatelessWidget {
  final bool isChecked;
  final double topH;
  final Function(bool?)? onchange;
  final String text;
  final VoidCallback onAddBtnTap;
  const CheckBoxAndAddBtnCard(
      {super.key,
      this.isChecked = false,
      required this.onchange,
      required this.text,
      this.topH = 11,
      required this.onAddBtnTap,
      
      
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 47,
            margin: EdgeInsets.only(right: 3, top: topH),
            padding: EdgeInsets.only(right: 10, left: 10),
            decoration: BoxDecoration(
                color: kGreyColor5, borderRadius: BorderRadius.circular(12)),
            child: Row(children: [
              Icon(
                Icons.circle,
                color: klightBlueColor2,
                size: 6,
              ),

              MyText(
                paddingLeft: 5,
                text: text,
                weight: FontWeight.w500,
                size: 14,
                color: kGreyColor2,
              ),
              //),
            ]),
          ),
        ),
        Container(
          height: 47,
          margin: EdgeInsets.only(right: 3, top: topH),
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: kGreyColor5, borderRadius: BorderRadius.circular(12)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CheckBoxWidget(
                onChanged: onchange,
                isChecked: isChecked,
              ),
              AppStyling().horizantallGap(8),
              InkWell(
                onTap: onAddBtnTap,
                child: CommonImageView(
                    radius: 2,
                    height: 20,
                    width: 20,
                    imagePath: Assets.imagesAddIcon),
              )
            ],
          ),
        ),
      ],
    );
  }
}

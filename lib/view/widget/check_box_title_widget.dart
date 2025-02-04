import 'package:flutter/material.dart';
import 'package:extra_set_of_mitts/constants/app_colors.dart';
import 'package:extra_set_of_mitts/view/widget/checkbox_widget.dart';
import 'package:extra_set_of_mitts/view/widget/my_text_widget.dart';

class CheckBoxTitleWidget extends StatelessWidget {
  final bool isChecked;
  final double topH;
  final Function(bool?)? onchange;
  final String text;
  final Color bkColor;
  const CheckBoxTitleWidget({
    super.key,
    this.isChecked = false,
    required this.onchange,
    required this.text,
    this.topH = 10,
    this.bkColor = kGreyColor5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 47,
            margin: EdgeInsets.only(top: topH),
            padding: EdgeInsets.only(right: 12, left: 12),
            decoration: BoxDecoration(
                color: bkColor, borderRadius: BorderRadius.circular(12)),
            child: Row(children: [
              Icon(
                Icons.circle,
                color: klightBlueColor2,
                size: 6,
              ),

              Expanded(
                child: MyText(
                  paddingLeft: 5,
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
              //),
            ]),
          ),
        ),
      ],
    );
  }
}

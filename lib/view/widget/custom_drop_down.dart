// ignore: must_be_immutable
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:two_local_gals_housekeeping/constants/app_colors.dart';
import 'package:two_local_gals_housekeeping/constants/app_images.dart';
import 'package:two_local_gals_housekeeping/view/widget/common_image_view_widget.dart';
import 'package:two_local_gals_housekeeping/view/widget/my_text_widget.dart';

class CustomDropDown extends StatelessWidget {
  final List<dynamic>? items;
  String? selectedValue;
  final ValueChanged<dynamic>? onChanged;
  String hint;
  Color? bgColor;
  Color? hintTextColor;

  CustomDropDown(
      {super.key,
      required this.hint,
      required this.items,
      this.selectedValue,
      required this.onChanged,
      this.bgColor,
      this.hintTextColor});

  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      underline: InputDecorator(decoration: InputDecoration()),
      isDense: true,
      isExpanded: true,
      buttonStyleData: ButtonStyleData(
          height: 47.12,
          padding: EdgeInsets.symmetric(horizontal: 8.02),
          decoration: BoxDecoration(
              // Border Decoration
              border: Border.all(
                color: kblueColor4,
              ),
              color: kGreyColor5,
              borderRadius: BorderRadius.circular(8))),
      dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kGreyColor5,
      )),
      menuItemStyleData: MenuItemStyleData(
        height: 47,
      ),
      items: items!
          .map(
            (item) => DropdownMenuItem<dynamic>(
              value: item,
              child: MyText(
                text: item,
                color: kBlackColor1,
                size: 13.44,
              ),
            ),
          )
          .toList(),
      hint: MyText(
        text: hint,
        color: kBlackColor1,
        size: 13.44,
      ),
      value: selectedValue,
      onChanged: onChanged,
      iconStyleData: IconStyleData(
          icon: CommonImageView(
        svgPath: Assets.imagesDropdownArrowDown,
      )),
    );
  }
}

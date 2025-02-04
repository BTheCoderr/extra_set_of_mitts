import 'package:flutter/material.dart';
import 'package:extra_set_of_mitts/constants/app_colors.dart';
import 'package:extra_set_of_mitts/view/widget/common_image_view_widget.dart';

class IconBtn extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final double iconSize;
  const IconBtn(
      {super.key, required this.onTap, required this.icon, this.iconSize = 10});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kPrimaryColor.withOpacity(.5),
        ),
        child: Center(
          child: CommonImageView(
            imagePath: icon,
            height: 16,
            width: 16,

            // width: iconSize,
          ),
        ),
      ),
    );
  }
}

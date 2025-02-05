import 'package:extra_set_of_mitts/constants/app_colors.dart';
import 'package:extra_set_of_mitts/constants/app_images.dart';
import 'package:extra_set_of_mitts/view/widget/common_image_view_widget.dart';
import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  final VoidCallback onTap;
  const BackBtn({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: kblackShadowColor.withOpacity(.05),
                  offset: Offset(0, 2),
                  blurRadius: 20)
            ]),
        child: Center(
          child: CommonImageView(
            imagePath: Assets.imagesBackArrowIcon,
            height: 11.17,
            width: 17.58,
          ),
        ),
      ),
    );
  }
}

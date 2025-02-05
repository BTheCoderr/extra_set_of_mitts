import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:extra_set_of_mitts/constants/app_colors.dart';

class TopDivider extends StatelessWidget {
  final Color clr;
  const TopDivider({super.key, this.clr = klightBlueColor3});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DottedLine(
            lineThickness: 1,
            lineLength: double.infinity,
            dashColor: clr,
          ),
        ),
      ],
    );
  }
}

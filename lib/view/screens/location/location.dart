import 'package:flutter/material.dart';
import 'package:extra_set_of_mitts/constants/app_colors.dart';
import 'package:extra_set_of_mitts/constants/app_images.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: kPrimaryColor,
            image: DecorationImage(
                image: AssetImage(Assets.imagesMapImg), fit: BoxFit.cover)));
  }
}

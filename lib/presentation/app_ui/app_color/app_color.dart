import 'package:flutter/material.dart';

class AppColor {
  static AppColor? _instance;
  static AppColor get instance {
    return _instance ??= AppColor._init();
  }

  AppColor._init();

  final Color stockTrackerBlack = const Color(0xFF121212);
  final Color stockTrackerGreen = const Color(0XFF037F00);
  final Color stockTrackerWhite = const Color(0XFFF7F7F7);
  final Color stockTrackerRed = const Color.fromARGB(255, 255, 108, 108);
  final Color darkGrey = const Color(0XFF282828);
  final Color lightGrey = const Color(0XFFDADADA);
}

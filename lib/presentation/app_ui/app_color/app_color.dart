import 'package:flutter/material.dart';

class AppColor {
  static AppColor? _instance;
  static AppColor get instance {
    return _instance ??= AppColor._init();
  }

  AppColor._init();

  final Color rentalBlack = const Color(0xFF121212);
  final Color rentalGreen = const Color(0XFF037F00);
  final Color rentalWhite = const Color(0XFFF7F7F7);
  final Color rentalRed = const Color(0xFF7F0800);
  final Color darkGrey = const Color(0XFF282828);
  final Color lightGrey = const Color(0XFFDADADA);
}

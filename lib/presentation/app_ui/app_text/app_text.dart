import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_color/app_color.dart';

class AppText {
  static AppText? _instance;
  static AppText get instance {
    return _instance ??= AppText._init();
  }

  AppText._init();

  final TextStyle bold_24px = GoogleFonts.openSans(
    color: AppColor.instance.stockTrackerGreen,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
  );
  final TextStyle medium_12px = GoogleFonts.openSans(
    color: AppColor.instance.stockTrackerBlack,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );
  final TextStyle medium_20px = GoogleFonts.openSans(
    color: AppColor.instance.stockTrackerBlack,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );
}

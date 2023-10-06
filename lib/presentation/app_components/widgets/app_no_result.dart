import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_ui/app_image/app_image.dart';
import '../../app_ui/app_text/app_text.dart';
import 'app_image_widget.dart';

class AppNoResult extends StatelessWidget {
  final int noResultCheck;
  const AppNoResult({required this.noResultCheck, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppImageWidget(
              name: AppImage.instance.iconNoResult, height: 128, width: 128),
          SizedBox(height: 8.h),
          if (noResultCheck == 0)
            Text("There is no rental car available.",
                style: AppText.instance.medium_20px)
          else if (noResultCheck == 1)
            Text("There is no car in your garage.",
                style: AppText.instance.medium_20px)
          else if (noResultCheck == 2)
            Text("There is no rented cars.",
                style: AppText.instance.medium_20px)
        ],
      ),
    );
  }
}

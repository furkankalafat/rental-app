import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_app/presentation/app_components/widgets/app_image_widget.dart';

import '../../../../app_ui/app_color/app_color.dart';
import '../../../../app_ui/app_image/app_image.dart';
import '../../../../app_ui/app_text/app_text.dart';

class CarInfo extends StatelessWidget {
  final String? brand;
  final String? model;
  final String? location;
  final String? gear;
  const CarInfo({
    this.brand,
    this.model,
    this.location,
    this.gear,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //car brand and model text
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "$brand $model",
              style: AppText.instance.medium_12px.copyWith(
                  color: AppColor.instance.rentalBlack, fontSize: 16.sp),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        //gear text
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImageWidget(
                name: AppImage.instance.iconGear, height: 24, width: 24),
            SizedBox(width: 2.w),
            Text(
              gear ?? "",
              style: AppText.instance.medium_12px
                  .copyWith(color: AppColor.instance.darkGrey.withOpacity(0.6)),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        //gear text
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImageWidget(
                name: AppImage.instance.iconLocation, height: 24, width: 24),
            SizedBox(width: 2.w),
            Text(
              location ?? "",
              style: AppText.instance.medium_12px
                  .copyWith(color: AppColor.instance.darkGrey.withOpacity(0.6)),
            ),
          ],
        ),
      ],
    );
  }
}

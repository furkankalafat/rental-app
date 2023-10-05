import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_app/presentation/app_components/widgets/app_image_widget.dart';
import 'package:rental_app/presentation/app_ui/app_text/app_text.dart';

import '../../../../app_ui/app_image/app_image.dart';

class PriceWidget extends StatelessWidget {
  final String? price;
  const PriceWidget({this.price, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "for 1 day:",
          style: AppText.instance.medium_12px.copyWith(fontSize: 10.sp),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImageWidget(
              name: AppImage.instance.iconEuro,
              height: 24,
              width: 24,
            ),
            Text(
              price ?? "",
              style: AppText.instance.medium_12px.copyWith(fontSize: 16.sp),
            )
          ],
        )
      ],
    );
  }
}

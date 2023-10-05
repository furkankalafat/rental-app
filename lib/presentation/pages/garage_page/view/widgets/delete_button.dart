import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app_ui/app_color/app_color.dart';
import '../../../../app_ui/app_text/app_text.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          width: 213.w,
          height: 30.h,
          decoration: BoxDecoration(
            color: AppColor.instance.rentalRed,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: Text(
              "Delete",
              textAlign: TextAlign.center,
              style: AppText.instance.medium_12px
                  .copyWith(color: AppColor.instance.rentalWhite),
            ),
          ),
        ));
  }
}

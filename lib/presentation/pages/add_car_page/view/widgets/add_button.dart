import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_app/presentation/pages/add_car_page/viewModel/add_car_view_model.dart';
import '../../../../app_ui/app_color/app_color.dart';
import '../../../../app_ui/app_text/app_text.dart';

class AddButton extends StatelessWidget {
  final AddCarViewModel viewModel;
  const AddButton({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          viewModel.addCar();
        },
        child: Container(
          height: 50.h,
          decoration: BoxDecoration(
            color: AppColor.instance.rentalGreen,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: Text(
              "Add",
              textAlign: TextAlign.center,
              style: AppText.instance.medium_12px.copyWith(
                  fontSize: 16.sp, color: AppColor.instance.rentalWhite),
            ),
          ),
        ));
  }
}

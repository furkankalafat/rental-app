// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_app/business_logic/cubits/rental_cubit/rental_cubit.dart';
import 'package:rental_app/business_logic/managers/notification_manager.dart';
import 'package:rental_app/presentation/pages/rental_page/model/car.dart';
import '../../../../app_ui/app_color/app_color.dart';
import '../../../../app_ui/app_text/app_text.dart';

class SelectButton extends StatelessWidget {
  final Car car;
  const SelectButton({
    required this.car,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          context.read<RentalCubit>().bookingRentalCar(car);
          await Future.delayed(const Duration(seconds: 3));
          await NotificationManager()
              .showNotification("RentalApp", "Your car is ready!");
        },
        child: Container(
          width: 213.w,
          height: 30.h,
          decoration: BoxDecoration(
            color: AppColor.instance.rentalGreen,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: Text(
              "Select",
              textAlign: TextAlign.center,
              style: AppText.instance.medium_12px
                  .copyWith(color: AppColor.instance.rentalWhite),
            ),
          ),
        ));
  }
}

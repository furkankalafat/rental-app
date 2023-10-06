import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_app/business_logic/cubits/garage_cubit/garage_cubit.dart';
import '../../../../../business_logic/managers/notification_manager.dart';
import '../../../../app_ui/app_color/app_color.dart';
import '../../../../app_ui/app_text/app_text.dart';

class DeleteButton extends StatelessWidget {
  final String id;
  const DeleteButton({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          context.read<GarageCubit>().deleteGarageCar(id);
          await Future.delayed(const Duration(seconds: 3));
          await NotificationManager().showNotification(
              "RentalApp", "The vehicle has been removed from your garage.");
        },
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_app/presentation/pages/rental_page/view/widgets/price_widget.dart';
import 'package:rental_app/presentation/pages/rental_page/view/widgets/select_button.dart';
import '../../../../app_components/widgets/app_image_widget.dart';
import '../../../../app_ui/app_color/app_color.dart';
import '../../../../app_ui/app_image/app_image.dart';
import '../../../garage_page/view/widgets/delete_button.dart';
import '../../model/car.dart';
import 'car_info.dart';

class CarCard extends StatelessWidget {
  final Car car;
  final int cardButtonCheck;
  const CarCard({
    required this.car,
    required this.cardButtonCheck,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.instance.lightGrey,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Available status bar
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                bottomLeft: Radius.circular(12.r),
              ),
              color: (car.isAvailable ?? false)
                  ? AppColor.instance.rentalGreen
                  : AppColor.instance.rentalRed,
            ),
            width: 10.w,
            height: 140.h,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //car icon
                Container(
                  height: 90.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: AppColor.instance.rentalWhite,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: AppImageWidget(
                      name: AppImage.instance.iconCar, height: 24, width: 24),
                ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CarInfo(
                          brand: car.brand,
                          model: car.model,
                          location: car.location,
                          gear: car.gear,
                        ),
                        //TODO will check for spacing
                        PriceWidget(
                          price: car.price,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    if (cardButtonCheck == 0)
                      SelectButton(car: car)
                    else if (cardButtonCheck == 1)
                      const DeleteButton()
                    else if (cardButtonCheck == 2)
                      const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

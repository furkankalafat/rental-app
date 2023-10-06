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
              color: cardButtonCheck == 2
                  ? AppColor.instance.rentalRed
                  : AppColor.instance.rentalGreen,
            ),
            width: 10.w,
            height: 140.h,
          ),
          Expanded(
            child: SizedBox(
              height: 140.h,
              child: Padding(
                padding: EdgeInsets.only(top: 16.0.h, left: 16.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //car icon
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 90.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          color: AppColor.instance.rentalWhite,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: AppImageWidget(
                            name: AppImage.instance.iconCar,
                            height: 24,
                            width: 24),
                      ),
                    ),
                    //SizedBox(width: 8.w),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0.w, right: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CarInfo(
                                  brand: car.brand,
                                  model: car.model,
                                  location: car.location,
                                  gear: car.gear,
                                ),
                                PriceWidget(
                                  price: car.price,
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            if (cardButtonCheck == 0)
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0.h),
                                child: SelectButton(car: car),
                              )
                            else if (cardButtonCheck == 1)
                              DeleteButton(
                                id: car.id!,
                              )
                            else if (cardButtonCheck == 2)
                              const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

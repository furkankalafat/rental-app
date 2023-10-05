import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_app/presentation/pages/rental_page/view/widgets/price_widget.dart';
import 'package:rental_app/presentation/pages/rental_page/view/widgets/select_button.dart';
import 'package:rental_app/presentation/pages/rental_page/viewModel/rental_view_model.dart';

import '../../../../app_components/widgets/app_image_widget.dart';
import '../../../../app_ui/app_color/app_color.dart';
import '../../../../app_ui/app_image/app_image.dart';
import 'car_info.dart';

class CarCard extends StatelessWidget {
  final String? brand;
  final String? model;
  final String? price;
  final String? location;
  final String? gear;
  final bool isAvailable;
  final RentalViewModel viewModel;
  const CarCard({
    this.brand,
    this.model,
    this.price,
    this.location,
    this.gear,
    this.isAvailable = false,
    required this.viewModel,
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
              color: isAvailable
                  ? AppColor.instance.stockTrackerRed
                  : AppColor.instance.stockTrackerGreen,
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
                    color: AppColor.instance.stockTrackerWhite,
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
                          brand: brand,
                          model: model,
                          location: location,
                          gear: gear,
                        ),
                        //TODO will check
                        SizedBox(
                          width: 50.w,
                        ),
                        PriceWidget(
                          price: price,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    SelectButton(viewModel: viewModel),
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

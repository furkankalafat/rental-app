import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_app/presentation/pages/add_car_page/viewModel/add_car_view_model.dart';
import '../../../../app_components/widgets/app_image_widget.dart';
import '../../../../app_ui/app_color/app_color.dart';
import '../../../../app_ui/app_image/app_image.dart';
import '../../../../app_ui/app_text/app_text.dart';

class CarGearDropdown extends StatelessWidget {
  final AddCarViewModel viewModel;
  const CarGearDropdown({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            "Gear",
            style: AppText.instance.medium_12px.copyWith(
              fontSize: 16.sp,
              color: AppColor.instance.rentalBlack,
            ),
          ),
        ),
        DropdownButtonFormField2(
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.zero,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                width: 2.w,
                color: AppColor.instance.lightGrey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                width: 2.w,
                color: AppColor.instance.lightGrey,
              ),
            ),
          ),
          isExpanded: true,
          value: viewModel.currentGearValue,
          iconStyleData: IconStyleData(
            icon: AppImageWidget(
              name: AppImage.instance.iconArrowDown,
              height: 24,
              width: 24,
            ),
          ),
          //customize clickable area
          buttonStyleData: ButtonStyleData(
            height: 60.h,
            padding: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              color: AppColor.instance.lightGrey,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          items: viewModel.gears
              .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: AppText.instance.medium_12px.copyWith(
                      color: AppColor.instance.rentalBlack,
                    ),
                  )))
              .toList(),
          onChanged: ((value) => viewModel.onChanged(value, true)),
          validator: viewModel.emptyValidator,
        ),
      ],
    );
  }
}

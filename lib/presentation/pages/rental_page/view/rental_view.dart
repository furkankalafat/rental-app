import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_app/presentation/app_ui/app_color/app_color.dart';
import 'package:rental_app/presentation/pages/rental_page/view/widgets/car_card.dart';

import '../../../../core/base/view/base_view.dart';
import '../viewModel/rental_view_model.dart';

class RentalView extends StatelessWidget {
  const RentalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RentalViewModel>(
        viewModel: RentalViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, RentalViewModel viewModel) {
          return Scaffold(
            backgroundColor: AppColor.instance.stockTrackerWhite,
            body: SingleChildScrollView(
              child: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20.h),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: viewModel.rentalCars.length,
                      itemBuilder: (context, index) => CarCard(
                        viewModel: viewModel,
                        brand: viewModel.rentalCars[index].brand,
                        model: viewModel.rentalCars[index].model,
                        price: viewModel.rentalCars[index].price,
                        gear: viewModel.rentalCars[index].gear,
                        location: viewModel.rentalCars[index].location,
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              )),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:rental_app/presentation/app_components/widgets/app_app_bar.dart';
import 'package:rental_app/presentation/app_ui/app_color/app_color.dart';
import 'package:rental_app/presentation/pages/garage_page/viewModel/garage_view_model.dart';
import 'package:rental_app/presentation/pages/rental_page/model/car.dart';
import 'package:rental_app/presentation/pages/rental_page/view/widgets/car_card.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../app_components/widgets/app_image_widget.dart';
import '../../../app_ui/app_image/app_image.dart';

class GarageView extends StatelessWidget {
  const GarageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<GarageViewModel>(
        viewModel: GarageViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, GarageViewModel viewModel) {
          return Scaffold(
            appBar: const AppAppBar(
              text: "Garage",
              backIsActive: false,
            ),
            backgroundColor: AppColor.instance.rentalWhite,
            floatingActionButton: FloatingActionButton(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              backgroundColor: AppColor.instance.rentalGreen,
              child: AppImageWidget(
                name: AppImage.instance.iconAdd,
                height: 24,
                width: 24,
                color: AppColor.instance.rentalWhite,
              ),
              onPressed: () {
                Get.toNamed("/add");
              },
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20.h),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: viewModel.rentalCars.length,
                      itemBuilder: (context, index) => CarCard(
                        //TODO
                        cardButtonCheck: 1,
                        car: Car(),
                      ),
                    ),
                  ],
                ),
              )),
            ),
          );
        });
  }
}

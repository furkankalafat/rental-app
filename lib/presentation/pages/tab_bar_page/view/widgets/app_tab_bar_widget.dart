import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rental_app/presentation/app_ui/app_text/app_text.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../../../app_components/widgets/app_image_widget.dart';
import '../../../../app_ui/app_color/app_color.dart';
import '../../../../app_ui/app_image/app_image.dart';
import '../../viewModel/tab_bar_view_model.dart';

class AppTabBarWidget extends StatelessWidget {
  final AppTabBarViewModel viewModel;
  const AppTabBarWidget({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: viewModel,
      builder: (vm) {
        return TabBar(
          onTap: viewModel.onTapTabBar,
          indicator: MaterialIndicator(
              topLeftRadius: 0,
              topRightRadius: 0,
              bottomLeftRadius: 3,
              bottomRightRadius: 3,
              tabPosition: TabPosition.top,
              horizontalPadding: 35,
              height: 2,
              strokeWidth: 4,
              color: AppColor.instance.rentalGreen),
          labelColor: AppColor.instance.rentalGreen,
          unselectedLabelColor: AppColor.instance.darkGrey,
          labelStyle: AppText.instance.medium_12px
              .copyWith(fontSize: 10.sp, fontWeight: FontWeight.bold),
          unselectedLabelStyle:
              AppText.instance.medium_12px.copyWith(fontSize: 10.sp),
          controller: viewModel.appTabProvider.controller,
          tabs: <Widget>[
            Tab(
              child: Column(
                children: [
                  AppImageWidget(
                    name: viewModel.appTabProvider.controller.index == 0
                        ? AppImage.instance.iconRentalFill
                        : AppImage.instance.iconRentalOutline,
                    height: 20,
                    width: 28,
                    color: viewModel.appTabProvider.controller.index == 0
                        ? AppColor.instance.rentalGreen
                        : AppColor.instance.darkGrey,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text("Rental"),
                  )
                ],
              ),
            ),
            Tab(
              child: Column(
                children: [
                  AppImageWidget(
                    name: viewModel.appTabProvider.controller.index == 1
                        ? AppImage.instance.iconGarageFill
                        : AppImage.instance.iconGarageOutline,
                    height: 20,
                    width: 28,
                    color: viewModel.appTabProvider.controller.index == 1
                        ? AppColor.instance.rentalGreen
                        : AppColor.instance.darkGrey,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text("Garage"),
                  )
                ],
              ),
            ),
            Tab(
              child: Column(
                children: [
                  AppImageWidget(
                    name: viewModel.appTabProvider.controller.index == 2
                        ? AppImage.instance.iconBookingFill
                        : AppImage.instance.iconBookingOutline,
                    height: 20,
                    width: 28,
                    color: viewModel.appTabProvider.controller.index == 2
                        ? AppColor.instance.rentalGreen
                        : AppColor.instance.darkGrey,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text("Booking"),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

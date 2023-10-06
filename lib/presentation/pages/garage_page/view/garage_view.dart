import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rental_app/business_logic/cubits/garage_cubit/garage_cubit.dart';
import 'package:rental_app/presentation/app_components/widgets/app_app_bar.dart';
import 'package:rental_app/presentation/app_ui/app_color/app_color.dart';
import 'package:rental_app/presentation/pages/garage_page/viewModel/garage_view_model.dart';
import 'package:rental_app/presentation/pages/rental_page/view/widgets/car_card.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../app_components/widgets/app_image_widget.dart';
import '../../../app_components/widgets/app_indicator.dart';
import '../../../app_components/widgets/app_no_result.dart';
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
          return BlocProvider.value(
            value: Get.find<GarageCubit>()..getGarageCars(),
            child: Scaffold(
              appBar: const AppAppBar(text: "Garage", backIsActive: false),
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
              body: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: BlocConsumer<GarageCubit, GarageState>(
                  listener: (context, state) {
                    if (state is GarageAdded) {
                      context.read<GarageCubit>().getGarageCars();
                    } else if (state is GarageDeleted) {
                      Future.delayed(const Duration(seconds: 3));
                      context.read<GarageCubit>().getGarageCars();
                    }
                  },
                  builder: (context, state) {
                    if (state is GarageFetching) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                              child: CircularProgressIndicator(
                            color: AppColor.instance.rentalGreen,
                          )),
                        ],
                      );
                    } else if (state is GarageFetched) {
                      final garageList = state.carResult.reversed.toList();
                      return ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20.h),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: garageList.length,
                        itemBuilder: (context, index) => CarCard(
                          cardButtonCheck: 1,
                          car: garageList[index],
                        ),
                      );
                    } else if (state is GarageFetchFailed) {
                      return const AppNoResult(
                        noResultCheck: 1,
                      );
                    }
                    return const AppIndicator();
                  },
                ),
              )),
            ),
          );
        });
  }
}

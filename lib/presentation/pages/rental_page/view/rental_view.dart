import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_app/presentation/app_components/widgets/app_app_bar.dart';
import 'package:rental_app/presentation/app_components/widgets/app_indicator.dart';
import 'package:rental_app/presentation/app_components/widgets/app_no_result.dart';
import 'package:rental_app/presentation/app_ui/app_color/app_color.dart';
import 'package:rental_app/presentation/pages/rental_page/service/rental_repository.dart';
import 'package:rental_app/presentation/pages/rental_page/view/widgets/car_card.dart';
import '../../../../business_logic/cubits/rental_cubit/rental_cubit.dart';
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
          return BlocProvider(
            create: (context) =>
                RentalCubit(RentalRepository())..getRentalCars(),
            child: Scaffold(
              appBar: const AppAppBar(backIsActive: false, text: "Rental"),
              backgroundColor: AppColor.instance.rentalWhite,
              body: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: BlocConsumer<RentalCubit, RentalState>(
                  listener: (context, state) {
                    if (state is BookingAdded) {
                      context.read<RentalCubit>().deleteRentalCar(state.id);
                    } else if (state is RentalDeleted) {
                      context.read<RentalCubit>().getRentalCars();
                    }
                  },
                  builder: (context, state) {
                    if (state is RentalFetching) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 200.h),
                          Center(
                              child: CircularProgressIndicator(
                            color: AppColor.instance.rentalGreen,
                          )),
                        ],
                      );
                    } else if (state is RentalFetched) {
                      final rentalList = state.carResult;
                      return ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20.h),
                        shrinkWrap: true,
                        itemCount: rentalList.length,
                        itemBuilder: (context, index) => CarCard(
                          cardButtonCheck: 0,
                          car: rentalList[index],
                        ),
                      );
                    } else if (state is RentalFetchFailed) {
                      return const AppNoResult(
                        noResultCheck: 0,
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

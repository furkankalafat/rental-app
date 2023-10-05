import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_app/business_logic/cubits/booking_cubit/booking_cubit.dart';
import 'package:rental_app/presentation/app_components/widgets/app_app_bar.dart';
import 'package:rental_app/presentation/app_ui/app_color/app_color.dart';
import 'package:rental_app/presentation/pages/booking_page/service/booking_repository.dart';

import '../../../../core/base/view/base_view.dart';
import '../../rental_page/view/widgets/car_card.dart';
import '../viewModel/booking_view_model.dart';

class BookingView extends StatelessWidget {
  const BookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<BookingViewModel>(
        viewModel: BookingViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, BookingViewModel viewModel) {
          return BlocProvider(
            create: (context) =>
                BookingCubit(BookingRepository())..getBookingCars(),
            child: Scaffold(
              appBar: const AppAppBar(backIsActive: false, text: "Booking"),
              backgroundColor: AppColor.instance.rentalWhite,
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: BlocBuilder<BookingCubit, BookingState>(
                      builder: (context, state) {
                        if (state is BookingFetching) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 200.h),
                              const Center(child: CircularProgressIndicator()),
                            ],
                          );
                        } else if (state is BookingFetched) {
                          final bookingList = state.bookingResult;
                          return Column(
                            children: [
                              ListView.separated(
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 20.h),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: bookingList.length,
                                itemBuilder: (context, index) => CarCard(
                                  cardButtonCheck: 2,
                                  car: bookingList[index],
                                ),
                              ),
                            ],
                          );
                        } else if (state is BookingFetchFailed) {}
                        return const SizedBox();
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

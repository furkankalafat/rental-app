import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_app/presentation/pages/booking_page/view/booking_view.dart';
import 'package:rental_app/presentation/pages/rental_page/view/rental_view.dart';
import 'package:rental_app/presentation/pages/tab_bar_page/view/widgets/app_tab_bar_widget.dart';
import '../../../../core/base/view/base_stateful_view.dart';
import '../../garage_page/view/garage_view.dart';
import '../viewModel/tab_bar_view_model.dart';

class AppTabBarView extends StatelessWidget {
  const AppTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseStatefulView<AppTabBarViewModel>(
        viewModel: AppTabBarViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, AppTabBarViewModel viewModel) {
          return Scaffold(
            bottomNavigationBar: PreferredSize(
              preferredSize: Size.fromHeight(82.h),
              child: SizedBox(
                height: 82.h,
                child: Theme(
                    data: ThemeData(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent),
                    child: AppTabBarWidget(
                      viewModel: viewModel,
                    )),
              ),
            ),
            body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: viewModel.appTabProvider.controller,
                children: const [RentalView(), GarageView(), BookingView()]),
          );
        });
  }
}

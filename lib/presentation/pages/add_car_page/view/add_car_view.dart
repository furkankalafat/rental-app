import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_app/presentation/app_components/widgets/app_form_field.dart';
import 'package:rental_app/presentation/app_ui/app_color/app_color.dart';
import 'package:rental_app/presentation/pages/add_car_page/view/widgets/add_button.dart';
import 'package:rental_app/presentation/pages/add_car_page/view/widgets/car_gear_dropdown.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../app_components/widgets/app_app_bar.dart';
import '../viewModel/add_car_view_model.dart';

class AddCarView extends StatelessWidget {
  const AddCarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AddCarViewModel>(
        viewModel: AddCarViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, AddCarViewModel viewModel) {
          return Form(
            key: viewModel.formKey,
            child: Scaffold(
              appBar: const AppAppBar(
                text: "Add Car",
                backIsActive: true,
              ),
              backgroundColor: AppColor.instance.rentalWhite,
              body: SingleChildScrollView(
                child: SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      AppFormField(
                        validator: viewModel.emptyValidator,
                        controller: viewModel.cardBrandController,
                        fieldName: "Brand",
                      ),
                      SizedBox(height: 20.h),
                      AppFormField(
                        validator: viewModel.emptyValidator,
                        controller: viewModel.carModelController,
                        fieldName: "Model",
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: CarGearDropdown(viewModel: viewModel)),
                          SizedBox(width: 21.w),
                          Expanded(
                            child: AppFormField(
                              validator: viewModel.emptyValidator,
                              controller: viewModel.priceController,
                              fieldName: "Price",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      AppFormField(
                        validator: viewModel.emptyValidator,
                        controller: viewModel.locationController,
                        fieldName: "Location",
                      ),
                      SizedBox(height: 40.h),
                      AddButton(
                        viewModel: viewModel,
                      ),
                    ],
                  ),
                )),
              ),
            ),
          );
        });
  }
}

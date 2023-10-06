import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_app/business_logic/cubits/garage_cubit/garage_cubit.dart';
import 'package:rental_app/business_logic/mixin/validation_mixin.dart';
import 'package:rental_app/presentation/pages/rental_page/model/car.dart';
import '../../../../business_logic/managers/notification_manager.dart';
import '../../../../core/base/model/base_view_model.dart';

class AddCarViewModel extends GetxController
    with ValidationMixin
    implements BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController cardBrandController = TextEditingController();
  final TextEditingController carModelController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  late String currentGearValue;

  final List<String> gears = [
    "Automatic",
    "Manual",
  ];

  void addCar() async {
    if (formKey.currentState!.validate()) {
      final currentCar = Car(
        brand: cardBrandController.text,
        model: carModelController.text,
        gear: currentGearValue,
        location: locationController.text,
        price: priceController.text,
        isAvailable: true,
      );
      Get.find<GarageCubit>().addGarageCar(currentCar);
      Future.delayed(const Duration(milliseconds: 200))
          .then((value) => Get.back());

      await Future.delayed(const Duration(seconds: 3));
      await NotificationManager()
          .showNotification("RentalApp", "Car added to your garage.");
    }
  }

  void onChanged(String? value, bool? isUnitValue) {
    if (isUnitValue != null && isUnitValue) {
      //for unit value
      if (value != null && value.isNotEmpty) {
        currentGearValue = value;
      }
    }
  }

  void initCurrentGear() {
    currentGearValue = gears.first;
  }

  @override
  void init() {
    initCurrentGear();
  }

  @override
  BuildContext? context;

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }
}

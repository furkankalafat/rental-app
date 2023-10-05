import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_app/business_logic/mixin/validation_mixin.dart';

import '../../../../core/base/model/base_view_model.dart';

class AddCarViewModel extends GetxController
    with ValidationMixin
    implements BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController cardBrandController = TextEditingController();
  final TextEditingController carModelController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController gearController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  late String currentGearValue;

  final List<String> gears = [
    "Automatic",
    "Manual",
  ];

  void addCar() {
    if (formKey.currentState!.validate()) {}
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
    // TODO: implement setContext
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_app/business_logic/cubits/garage_cubit/garage_cubit.dart';
import 'package:rental_app/presentation/pages/garage_page/service/garage_repository.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../rental_page/model/car.dart';

class GarageViewModel extends GetxController implements BaseViewModel {
  final List<Car> rentalCars = [
    Car(
        brand: "Mercedes",
        model: "C200",
        price: "50",
        location: "Zagreb Airport",
        gear: "Automatic",
        isAvailable: false),
    Car(
        brand: "Mercedes",
        model: "C200",
        price: "50",
        location: "Zagreb Airport",
        gear: "Automatic",
        isAvailable: false),
  ];

  void initializeCubit() {
    Get.put(GarageCubit(GarageRepository()));
  }

  @override
  void init() {
    initializeCubit();
  }

  @override
  BuildContext? context;

  @override
  void setContext(BuildContext context) {}
}

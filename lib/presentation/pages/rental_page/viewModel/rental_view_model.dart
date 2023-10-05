import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../model/car.dart';

class RentalViewModel extends GetxController implements BaseViewModel {
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

  @override
  void init() {}

  @override
  BuildContext? context;

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }
}

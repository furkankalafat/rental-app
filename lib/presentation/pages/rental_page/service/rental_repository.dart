import 'package:dio/dio.dart';

import '../model/car.dart';

class RentalRepository {
  final Dio _dio = Dio();
  Future<List<Car>> getRentalCars() async {
    final response = await _dio
        .get("https://651db8b444e393af2d5a41bb.mockapi.io/rental_cars");
    if (response.statusCode == 200) {
      final result = List<Car>.from(response.data.map((e) {
        return Car.fromJson(e);
      }));

      return result;
    } else {
      throw Exception("$response.statusCode");
    }
  }

  Future<String?> addBookingCar(Car car) async {
    final response = await _dio.post(
        "https://651efb0244a3a8aa47694ab2.mockapi.io/booking_cars",
        data: car.toJson());
    if (response.statusCode == 201) {
      return car.id;
    } else {
      throw Exception("$response.statusCode");
    }
  }

  Future<bool?> deleteRentalCar(String id) async {
    final response = await _dio
        .delete("https://651db8b444e393af2d5a41bb.mockapi.io/rental_cars/$id");
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("$response.statusCode");
    }
  }
}

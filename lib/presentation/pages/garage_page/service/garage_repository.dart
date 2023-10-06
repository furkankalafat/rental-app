import 'package:dio/dio.dart';

import '../../rental_page/model/car.dart';

class GarageRepository {
  final Dio _dio = Dio();
  Future<List<Car>> getGarageCars() async {
    final response =
        await _dio.get("https://651db8b444e393af2d5a41bb.mockapi.io/my_cars");
    if (response.statusCode == 200) {
      final result = List<Car>.from(response.data.map((e) {
        return Car.fromJson(e);
      }));

      return result;
    } else {
      throw Exception("$response.statusCode");
    }
  }

  Future<bool?> addGarageCar(Car car) async {
    final response = await _dio.post(
        "https://651db8b444e393af2d5a41bb.mockapi.io/my_cars",
        data: car.toJson());
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception("$response.statusCode");
    }
  }

  Future<bool?> deleteGarageCar(String id) async {
    final response = await _dio
        .delete("https://651db8b444e393af2d5a41bb.mockapi.io/my_cars/$id");
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("$response.statusCode");
    }
  }
}

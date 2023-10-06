import 'package:dio/dio.dart';

import '../../rental_page/model/car.dart';

class BookingRepository {
  final Dio _dio = Dio();
  Future<List<Car>> getBookingCars() async {
    final response = await _dio
        .get("https://651efb0244a3a8aa47694ab2.mockapi.io/booking_cars");
    if (response.statusCode == 200) {
      final result = List<Car>.from(response.data.map((e) {
        return Car.fromJson(e);
      }));
      return result;
    } else {
      throw Exception("$response.statusCode");
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rental_app/presentation/pages/rental_page/service/rental_repository.dart';

import '../../../presentation/pages/rental_page/model/car.dart';

part 'rental_state.dart';

class RentalCubit extends Cubit<RentalState> {
  final RentalRepository _repository;
  RentalCubit(this._repository) : super(RentalInitial());

  Future<void> getRentalCars() async {
    try {
      emit(RentalFetching());
      final result = await _repository.getRentalCars();
      if (result.isNotEmpty) {
        emit(RentalFetched(result));
      } else {
        emit(RentalFetchFailed());
      }
    } catch (e) {
      emit(RentalFetchFailed());
    }
  }

  Future<void> bookingRentalCar(Car car) async {
    try {
      emit(BookingAdding());
      final result = await _repository.addBookingCar(car);
      if (result != null) {
        emit(BookingAdded(result));
      } else {
        emit(BookingAddFailed());
      }
    } catch (e) {
      emit(BookingAddFailed());
    }
  }

  Future<void> deleteRentalCar(String id) async {
    try {
      emit(RentalDeleting());
      final result = await _repository.deleteRentalCar(id);
      if (result == true && result != null) {
        emit(RentalDeleted(result));
      } else {
        emit(RentalDeleteFailed());
      }
    } catch (e) {
      emit(RentalDeleteFailed());
    }
  }
}

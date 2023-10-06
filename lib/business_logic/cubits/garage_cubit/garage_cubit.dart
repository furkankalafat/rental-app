import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../presentation/pages/garage_page/service/garage_repository.dart';
import '../../../presentation/pages/rental_page/model/car.dart';

part 'garage_state.dart';

class GarageCubit extends Cubit<GarageState> {
  final GarageRepository _repository;
  GarageCubit(this._repository) : super(GarageInitial());

  Future<void> getGarageCars() async {
    try {
      emit(GarageFetching());
      final result = await _repository.getGarageCars();
      if (result.isNotEmpty) {
        emit(GarageFetched(result));
      } else {
        emit(GarageFetchFailed());
      }
    } catch (e) {
      emit(GarageFetchFailed());
    }
  }

  Future<void> addGarageCar(Car car) async {
    try {
      emit(GarageAdding());
      final result = await _repository.addGarageCar(car);
      if (result ?? false) {
        emit(GarageAdded(result!));
      } else {
        emit(GarageAddFailed());
      }
    } catch (e) {
      emit(GarageAddFailed());
    }
  }

  Future<void> deleteGarageCar(String id) async {
    try {
      emit(GarageDeleting());
      final result = await _repository.deleteGarageCar(id);
      if (result == true && result != null) {
        emit(GarageDeleted(result));
      } else {
        emit(GarageDeleteFailed());
      }
    } catch (e) {
      emit(GarageDeleteFailed());
    }
  }
}

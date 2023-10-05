import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../presentation/pages/booking_page/service/booking_repository.dart';
import '../../../presentation/pages/rental_page/model/car.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingRepository _repository;
  BookingCubit(this._repository) : super(BookingInitial());

  Future<void> getBookingCars() async {
    try {
      emit(BookingFetching());
      final result = await _repository.getBookingCars();
      if (result.isNotEmpty) {
        emit(BookingFetched(result));
      } else {
        emit(BookingFetchFailed());
      }
    } catch (e) {
      emit(BookingFetchFailed());
    }
  }
}

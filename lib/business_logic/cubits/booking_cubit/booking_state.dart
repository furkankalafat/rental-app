part of 'booking_cubit.dart';

sealed class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

final class BookingInitial extends BookingState {}

final class BookingFetching extends BookingState {}

final class BookingFetched extends BookingState {
  final List<Car> bookingResult;

  const BookingFetched(this.bookingResult);

  @override
  List<Object> get props => [bookingResult];
}

final class BookingFetchFailed extends BookingState {}

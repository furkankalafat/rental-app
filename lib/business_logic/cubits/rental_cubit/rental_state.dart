part of 'rental_cubit.dart';

sealed class RentalState extends Equatable {
  const RentalState();

  @override
  List<Object> get props => [];
}

final class RentalInitial extends RentalState {}

//Getting States

final class RentalFetching extends RentalState {}

final class RentalFetched extends RentalState {
  final List<Car> carResult;

  const RentalFetched(this.carResult);

  @override
  List<Object> get props => [carResult];
}

final class RentalFetchFailed extends RentalState {}

//Adding States

final class BookingAdding extends RentalState {}

final class BookingAdded extends RentalState {
  final String id;
  const BookingAdded(this.id);

  @override
  List<Object> get props => [id];
}

final class BookingAddFailed extends RentalState {}

//Deleting States

final class RentalDeleting extends RentalState {}

final class RentalDeleted extends RentalState {
  final bool rentalDeleted;
  const RentalDeleted(this.rentalDeleted);

  @override
  List<Object> get props => [rentalDeleted];
}

final class RentalDeleteFailed extends RentalState {}

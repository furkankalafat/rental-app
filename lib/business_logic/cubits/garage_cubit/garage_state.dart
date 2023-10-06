part of 'garage_cubit.dart';

sealed class GarageState extends Equatable {
  const GarageState();

  @override
  List<Object> get props => [];
}

final class GarageInitial extends GarageState {}

final class GarageFetching extends GarageState {}

final class GarageFetched extends GarageState {
  final List<Car> carResult;

  const GarageFetched(this.carResult);

  @override
  List<Object> get props => [carResult];
}

final class GarageFetchFailed extends GarageState {}

final class GarageAdding extends GarageState {}

final class GarageAdded extends GarageState {
  final bool carAdded;
  const GarageAdded(this.carAdded);

  @override
  List<Object> get props => [carAdded];
}

final class GarageAddFailed extends GarageState {}

final class GarageDeleting extends GarageState {}

final class GarageDeleted extends GarageState {
  final bool garageCarDeleted;
  const GarageDeleted(this.garageCarDeleted);

  @override
  List<Object> get props => [garageCarDeleted];
}

final class GarageDeleteFailed extends GarageState {}

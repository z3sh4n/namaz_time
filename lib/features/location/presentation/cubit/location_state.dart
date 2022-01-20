part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  final double latitude;
  final double longitude;
  final AppError? failure;

  const LocationState(
    this.latitude,
    this.longitude, {
    this.failure,
  });

  @override
  String toString() => 'LocationState(latitude: $latitude, longitude: $longitude, failure: $failure)';
}

class LocationInitial extends LocationState {
  const LocationInitial(double latitude, double longitude, AppError failure)
      : super(latitude, longitude, failure: failure);

  @override
  List<Object> get props => [latitude, longitude];
}

class LocationLoading extends LocationState {
  const LocationLoading(double latitude, double longitude)
      : super(latitude, longitude);

  @override
  List<Object> get props => [latitude, longitude];
}

class LocationSuccess extends LocationState {
  const LocationSuccess(double latitude, double longitude)
      : super(latitude, longitude);

  @override
  List<Object> get props => [latitude, longitude];
}

class LocationFailed extends LocationState {
  const LocationFailed(double latitude, double longitude, AppError failure)
      : super(latitude, longitude, failure: failure);

  @override
  List<Object> get props => [latitude, longitude];
}

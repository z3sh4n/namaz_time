part of 'locationdetail_cubit.dart';

abstract class LocationdetailState extends Equatable {
  const LocationdetailState();

  @override
  List<Object> get props => [];
}

class LocationdetailLoading extends LocationdetailState {}

class LocationdetailError extends LocationdetailState {}

class LocationdetailLoaded extends LocationdetailState {
  final String address;

  const LocationdetailLoaded(this.address);
}

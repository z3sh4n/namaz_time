part of 'locationdetail_cubit.dart';

abstract class LocationdetailState extends Equatable {
  const LocationdetailState();

  @override
  List<Object> get props => [];
}

class LocationdetailInitial extends LocationdetailState {}

class LocationdetailLoaded extends LocationdetailState {
  final String address;

  const LocationdetailLoaded(this.address);

  @override
  String toString() => 'LocationdetailLoaded(address: $address)';
}

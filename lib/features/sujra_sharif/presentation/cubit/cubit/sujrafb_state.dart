part of 'sujrafb_cubit.dart';

abstract class SujraFBState extends Equatable {
  const SujraFBState();

  @override
  List<Object> get props => [];
}

class SujraFBInitial extends SujraFBState {}

class SujraFBLoaded extends SujraFBState {
  final String path;

  const SujraFBLoaded(this.path);

  @override
  List<Object> get props => [path];
}

class SujraFBError extends SujraFBState {}

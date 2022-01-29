part of 'sujrafb_cubit.dart';

abstract class SujraFBState extends Equatable {
  const SujraFBState();

  @override
  List<Object> get props => [];
}

class SujraFBLoading extends SujraFBState {}

class SujraFBLoaded extends SujraFBState {
  final String path;
  // final DownloadTask progress;

  const SujraFBLoaded(this.path, );

  @override
  List<Object> get props => [path];
}

class SujraFBError extends SujraFBState {}

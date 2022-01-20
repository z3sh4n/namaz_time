part of 'sujrasharif_cubit.dart';

abstract class SujraSharifState extends Equatable {
  const SujraSharifState();

  @override
  List<Object> get props => [];
}

class SujraSharifInitial extends SujraSharifState {}

class SujraSharifLoaded extends SujraSharifState {
  final List<SujraEntity> listSujraEntity;

  const SujraSharifLoaded(this.listSujraEntity);

  @override
  List<Object> get props => [listSujraEntity];
}

class SujraSharifError extends SujraSharifState {}

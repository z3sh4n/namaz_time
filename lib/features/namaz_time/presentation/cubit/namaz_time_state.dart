part of 'namaz_time_cubit.dart';

abstract class NamazTimeState extends Equatable {
  const NamazTimeState();

  @override
  List<Object> get props => [];
}

class NamazTimeInitial extends NamazTimeState {}

class NamazTimeLoaded extends NamazTimeState {
  final List<NamazTimeEntity> namazTimeList;

  const NamazTimeLoaded(this.namazTimeList);

  @override
  List<Object> get props => [namazTimeList];

  @override
  String toString() => 'NamazTimeLoaded(namazTimeList: $namazTimeList)';
}

class NamazTimeError extends NamazTimeState {
  final AppError error;

  const NamazTimeError(this.error);

  @override

  @override
  String toString() => 'NamazTimeError(error: $error)';
  List<Object> get props => [error];
}

class NamazTimeLoading extends NamazTimeState {}

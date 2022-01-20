import 'package:equatable/equatable.dart';

class NamazTimeEntity extends Equatable {
  final String namazName;
  final String namazTime;

  const NamazTimeEntity({
    required this.namazName,
    required this.namazTime,
  });

  @override
  List<Object?> get props => [namazName, namazTime];

  @override
  bool? get stringify => true;
}

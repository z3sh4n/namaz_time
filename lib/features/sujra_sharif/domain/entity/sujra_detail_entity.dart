import 'package:equatable/equatable.dart';

class SujraDetailEntity extends Equatable {
  final String eDetailTitle;
  final String data;

  const SujraDetailEntity({required this.eDetailTitle, required this.data, mDetailTitle});

  @override
  List<Object?> get props => [eDetailTitle, data];
}

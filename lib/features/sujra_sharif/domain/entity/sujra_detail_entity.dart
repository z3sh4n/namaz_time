import 'package:equatable/equatable.dart';

class SujraDetailEntity extends Equatable {
  final String title;
  final String data;

  const SujraDetailEntity({required this.title, required this.data});

  @override
  List<Object?> get props => [title, data];
}

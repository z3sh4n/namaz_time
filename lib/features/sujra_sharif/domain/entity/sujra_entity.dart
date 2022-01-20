import 'package:equatable/equatable.dart';

class SujraEntity extends Equatable{
  final String title;
  final String data;

  const SujraEntity({
    required this.title,
    required this.data,
  });

  @override
  List<Object?> get props => [title,data];
}

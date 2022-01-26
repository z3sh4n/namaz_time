import 'package:equatable/equatable.dart';

class SujraFBParams extends Equatable {
  final String name;

  const SujraFBParams({required this.name});
  @override
  List<Object?> get props => [name];
}

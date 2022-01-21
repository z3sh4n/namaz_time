import 'package:equatable/equatable.dart';
import 'sujra_detail_entity.dart';

class SujraEntity extends Equatable {
  final String title;
  final String image;
  final List<SujraDetailEntity> data;

  const SujraEntity({
    required this.image,
    required this.title,
    required this.data,
  });

  @override
  List<Object?> get props => [title, data,image];
}

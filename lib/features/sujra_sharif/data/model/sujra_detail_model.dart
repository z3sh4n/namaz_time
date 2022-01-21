import 'package:equatable/equatable.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/entity/sujra_detail_entity.dart';

class SujraDetailModel extends SujraDetailEntity {
  final String title;
  final String data;

  const SujraDetailModel({required this.title, required this.data})
      : super(title: title, data: data);

  @override
  List<Object?> get props => [title, data];
}

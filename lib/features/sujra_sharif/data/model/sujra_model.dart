import 'package:sdfsdf/features/sujra_sharif/data/model/sujra_detail_model.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/entity/sujra_entity.dart';

class SujraModel extends SujraEntity {
  final String title1;
  final String image1;
  final List<SujraDetailModel> sujraSharif;

  const SujraModel({
    required this.image1,
    required this.title1,
    required this.sujraSharif,
  }) : super(title: title1, data: sujraSharif, image: image1);

  @override
  List<Object?> get props => [title, sujraSharif, image];
}

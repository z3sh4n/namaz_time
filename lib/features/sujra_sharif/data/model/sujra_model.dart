import 'package:sdfsdf/features/sujra_sharif/domain/entity/sujra_entity.dart';

class SujraModel extends SujraEntity {
  final String title;
  // final String image;
  final String sujraSharif;

  const SujraModel({
    required this.title,
    // required this.image,
    required this.sujraSharif,
  }) : super(title: title, data: sujraSharif);

  @override
  List<Object?> get props => [title, sujraSharif];
}

import '../../domain/entity/sujra_detail_entity.dart';

class SujraDetailModel extends SujraDetailEntity {
  final String mDetailTitle;
  final String data;

  const SujraDetailModel({required this.mDetailTitle, required this.data})
      : super(eDetailTitle: mDetailTitle, data: data);

  @override
  List<Object?> get props => [eDetailTitle, data];
}

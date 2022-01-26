import 'sujra_detail_model.dart';
import '../../domain/entity/sujra_entity.dart';

class SujraModel extends SujraEntity {
  final String mTitleSubfold;
  final String mImagaSubfold;
  final List<SujraDetailModel> sujraSharifDetailList;

  const SujraModel({
    required this.mImagaSubfold,
    required this.mTitleSubfold,
    required this.sujraSharifDetailList,
  }) : super(title: mTitleSubfold, data: sujraSharifDetailList, image: mImagaSubfold);

  @override
  List<Object?> get props => [title, sujraSharifDetailList, image];
}

import '../model/sujra_detail_model.dart';
import '../model/sujra_model.dart';

abstract class SujraDataSource {
  Future<List<SujraModel>> getSujraSharif();
}

class SujraDataSourceImpl extends SujraDataSource {
  @override
  Future<List<SujraModel>> getSujraSharif() async {
    return [
      const SujraModel(
        image1: 'image1',
        title1: 'title1',
        sujraSharif: [
          SujraDetailModel(title: 'title', data: 'fsdlkfja'),
          SujraDetailModel(title: 'title', data: 'fsdlkfja'),
          SujraDetailModel(title: 'title', data: 'fsdlkfja'),
          SujraDetailModel(title: 'title', data: 'fsdlkfja'),
        ],
      )
    ];
  }
}

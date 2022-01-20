import 'package:sdfsdf/features/sujra_sharif/data/model/sujra_model.dart';

abstract class SujraDataSource {
  Future<List<SujraModel>> getSujraSharif();
}

class SujraDataSourceImpl extends SujraDataSource {
  @override
  Future<List<SujraModel>> getSujraSharif() async {
    return [
      const SujraModel(
        title: 'tikldjakljasdfjkjahdfhskdjftle',
        sujraSharif: 'data',
      ),
    ];
  }
}

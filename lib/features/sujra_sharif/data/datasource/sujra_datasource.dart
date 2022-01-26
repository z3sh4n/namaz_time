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
        mTitleSubfold: 'Akhtar Raza Khan',
        mImagaSubfold: 'assets/sujra_sharif_logos/Akhtar_raza_khan.png',
        sujraSharifDetailList: [
          SujraDetailModel(
            mDetailTitle: 'Shajrah Sharif In English',
            data: 'SHAJRA_SHAREEF_ENGLISH_ARK',
          ),
          SujraDetailModel(
            mDetailTitle: 'Shajrah Sharif In Gujrati',
            data: 'SHAJRA_SHAREEF_GUJARATI_ARK',
          ),
          SujraDetailModel(
            mDetailTitle: 'Shajrah Sharif In Hindi',
            data: 'SHAJRA_SHAREEF_HINDI_ARK',
          ),
          SujraDetailModel(
            mDetailTitle: 'Shajrah Sharif In Urdu',
            data: 'SHAJRA_SHAREEF_URDU_ARK',
          ),
        ],
      )
    ];
  }
}

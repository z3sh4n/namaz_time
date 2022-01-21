import 'package:adhan/adhan.dart' as adhan;
import 'package:intl/intl.dart';
import '../models/namaz_time_model.dart';

abstract class NamazRemoteDataSource {
  Future<List<NamazTimeModel>> getNamazTime(double lat, double lang);
}

class NamazRemoteDataSourceImpl extends NamazRemoteDataSource {
  @override
  Future<List<NamazTimeModel>> getNamazTime(double lat, double lang) async {
    final myCoordinates = adhan.Coordinates(
        lat, lang); // Replace with your own location lat, lng.
    final params = adhan.CalculationMethod.karachi.getParameters();
    params.madhab = adhan.Madhab.hanafi;
    final prayerTimes = adhan.PrayerTimes.today(myCoordinates, params);
    return [
      NamazTimeModel(
          namazName: 'Fajr',
          namazTime: DateFormat.jm().format(prayerTimes.fajr)),
      NamazTimeModel(
          namazName: 'Sunrise',
          namazTime: DateFormat.jm().format(prayerTimes.sunrise)),
      NamazTimeModel(
          namazName: 'Duhur',
          namazTime: DateFormat.jm().format(prayerTimes.dhuhr)),
      NamazTimeModel(
        namazName: 'Asr',
        namazTime: DateFormat.jm().format(prayerTimes.asr),
      ),
      NamazTimeModel(
          namazName: 'Maghrib',
          namazTime: DateFormat.jm().format(prayerTimes.maghrib)),
      NamazTimeModel(
          namazName: 'Isha',
          namazTime: DateFormat.jm().format(prayerTimes.isha))
    ];
  }
}

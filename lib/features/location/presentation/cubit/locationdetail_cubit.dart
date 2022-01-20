import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';

part 'locationdetail_state.dart';

class LocationdetailCubit extends Cubit<LocationdetailState> {
  LocationdetailCubit() : super(LocationdetailInitial());

  void getLocaitonDetail(double lat, double long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);

    Placemark place = placemarks[1];

    emit(
      LocationdetailLoaded(
        '${place.street},${place.locality},${place.administrativeArea},${place.country}',
      ),
    );
    print('adfkladsklf');
  }
}

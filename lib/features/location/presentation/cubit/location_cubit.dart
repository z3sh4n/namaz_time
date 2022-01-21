import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/app_error.dart';
import '../../../../core/usecase/no_params.dart';
import '../../domain/entities/location_entity.dart';
import '../../domain/usecase/get_location_usecase.dart';
import 'locationdetail_cubit.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  GetLocation getLocation;
  LocationdetailCubit locationdetailCubit;
  LocationCubit(this.getLocation, this.locationdetailCubit)
      : super(
          const LocationInitial(
            91,
            181,
            AppError(
              'initializing',
            ),
          ),
        );

  void initLocaiton() async {
    if (state.latitude > 90 && state.longitude > 180) {
      emit(LocationLoading(state.latitude, state.longitude));

      final Either<AppError, LocationEntity> eitherResponse =
          await getLocation(NoParams());

      emit(eitherResponse.fold((l) {
        return LocationFailed(state.latitude, state.longitude, l);
      }, (r) {
        // print(r);
        locationdetailCubit.getLocaitonDetail(r.latitude, r.longitude);
        return LocationSuccess(r.latitude, r.longitude);
      }));
    }
  }
}

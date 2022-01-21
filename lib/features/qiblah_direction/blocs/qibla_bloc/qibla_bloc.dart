import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../location/presentation/cubit/location_cubit.dart';

import '../../controller/qibla_controller.dart';

part 'qibla_event.dart';
part 'qibla_state.dart';

class QiblaBloc extends Bloc<QiblaEvent, QiblaState> {
  QiblaBloc() : super(QiblaInitial()) {
    on<RequestQiblahDirection>((event, emit) {
      requestQiblah(event, emit);
    });
  }

  void requestQiblah(event, emit) async {
    emit(QiblaLoading());

    if (event.locationState is LocationFailed) {
      emit(QiblaFailed(event.locationState.failure!));
    } else {
      final angle = calculateDirection(
        event.locationState.latitude,
        event.locationState.longitude,
      );
      emit(QiblaLoaded(angle));
    }
  }
}

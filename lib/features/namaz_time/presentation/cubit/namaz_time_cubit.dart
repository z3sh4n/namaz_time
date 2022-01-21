import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/app_error.dart';
import '../../../../core/usecase/namaz_time_params.dart';
import '../../domain/entities/namaz_time_entity.dart';
import '../../domain/usecases/get_namaz_time_list_usecase.dart';

part 'namaz_time_state.dart';

class NamazTimeCubit extends Cubit<NamazTimeState> {
  final GetNamazTimeList getNamazTimeList;
  NamazTimeCubit(this.getNamazTimeList) : super(NamazTimeInitial());

  Future<void> requestNamazTime(double latitude, double longitude) async {
    // List<Map<String, Object>> _notificationList = [];
    final Either<AppError, List<NamazTimeEntity>> either =
        await getNamazTimeList(NamazParams(latitude, longitude));

    either.fold(
      (l) => const NamazTimeError(AppError('sdafasd')),
      (r) {
        // final controller = TimingController(r);

        // _notificationList = await loadLocalNotification(controller.timingsList);

        // await addToLocalNotification(_notificationList);

        // print(_notificationList);
        return emit(NamazTimeLoaded(r));
      },
    );
  }
}

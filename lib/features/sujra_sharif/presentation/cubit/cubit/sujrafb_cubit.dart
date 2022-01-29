import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sdfsdf/core/errors/app_error.dart';
import 'package:sdfsdf/core/usecase/sujra_fb_params.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/usecase/get_sujra_fb_usecase.dart';

part 'sujrafb_state.dart';

class SujraFBCubit extends Cubit<SujraFBState> {
  final GetSujraFB sujraFB;

  SujraFBCubit(this.sujraFB) : super(SujraFBLoading());

  Future<void> getSujraFB(String name) async {
    final Either<AppError, void> either =
        await sujraFB(SujraFBParams(name: name));

    emit(either.fold(
      (l) => SujraFBError(),
      (r) {
        r;
        return const SujraFBLoaded(
          '',
        );
      },
    ));
  }
}

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sdfsdf/core/errors/app_error.dart';
import 'package:sdfsdf/core/usecase/no_params.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/entity/sujra_entity.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/usecase/get_sujra_sharif_usecase.dart';

part 'sujrasharif_state.dart';

class SujraSharifCubit extends Cubit<SujraSharifState> {
  final GetSujraSharifList getSujraSharifList;
  SujraSharifCubit(this.getSujraSharifList) : super(SujraSharifInitial());

  Future<void> getSujraSharifListf() async {
    final Either<AppError, List<SujraEntity>> either =
        await getSujraSharifList(NoParams());

      either.fold(
        (l) => SujraSharifError(),
        (r) => emit(SujraSharifLoaded(r)),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/app_error.dart';
import '../../../../core/usecase/no_params.dart';
import '../../domain/entity/sujra_entity.dart';
import '../../domain/usecase/get_sujra_sharif_usecase.dart';

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

import 'package:dartz/dartz.dart';
import 'package:sdfsdf/core/errors/app_error.dart';
import 'package:sdfsdf/core/usecase/namaz_time_params.dart';
import 'package:sdfsdf/core/usecase/usecase.dart';
import 'package:sdfsdf/features/namaz_time/domain/entities/namaz_time_entity.dart';
import 'package:sdfsdf/features/namaz_time/domain/repositories/namaz_time_repository.dart';

class GetNamazTimeList extends Usecase<List<NamazTimeEntity>, NamazParams> {
  final NamazTimeRepository namazTimeRepository;

  GetNamazTimeList(this.namazTimeRepository);

  @override
  Future<Either<AppError, List<NamazTimeEntity>>> call(params) async {
    return await namazTimeRepository.getNamazTimeList(params.lat, params.lang);
  }
}

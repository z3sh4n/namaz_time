import 'package:dartz/dartz.dart';
import '../../../../core/errors/app_error.dart';
import '../../../../core/usecase/namaz_time_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/namaz_time_entity.dart';
import '../repositories/namaz_time_repository.dart';

class GetNamazTimeList extends Usecase<List<NamazTimeEntity>, NamazParams> {
  final NamazTimeRepository namazTimeRepository;

  GetNamazTimeList(this.namazTimeRepository);

  @override
  Future<Either<AppError, List<NamazTimeEntity>>> call(params) async {
    return await namazTimeRepository.getNamazTimeList(params.lat, params.lang);
  }
}

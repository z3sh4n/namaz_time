import 'package:dartz/dartz.dart';
import '../../../../core/errors/app_error.dart';
import '../entities/namaz_time_entity.dart';


abstract class NamazTimeRepository {
  Future<Either<AppError, List<NamazTimeEntity>>> getNamazTimeList(double lat,double long);
}

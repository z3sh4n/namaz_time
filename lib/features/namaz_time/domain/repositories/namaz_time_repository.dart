import 'package:dartz/dartz.dart';
import 'package:sdfsdf/core/errors/app_error.dart';
import 'package:sdfsdf/features/namaz_time/domain/entities/namaz_time_entity.dart';


abstract class NamazTimeRepository {
  Future<Either<AppError, List<NamazTimeEntity>>> getNamazTimeList(double lat,double long);
}

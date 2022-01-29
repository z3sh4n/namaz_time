import 'package:dartz/dartz.dart';
import 'package:namaz_time/core/errors/app_error.dart';

abstract class SujraFireBaseRepo {
  Future<Either<AppError, void>> getSujraFromFirebase(String name);
}

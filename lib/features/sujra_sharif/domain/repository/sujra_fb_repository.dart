import 'package:dartz/dartz.dart';
import 'package:sdfsdf/core/errors/app_error.dart';

abstract class SujraFireBaseRepo {
  Future<Either<AppError, String>> getSujraFromFirebase(String name);
}

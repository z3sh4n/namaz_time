import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sdfsdf/core/errors/app_error.dart';

abstract class SujraFireBaseRepo {
  Future<Either<AppError, void>> getSujraFromFirebase(String name);
}

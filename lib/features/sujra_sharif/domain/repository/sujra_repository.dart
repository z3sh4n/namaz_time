import 'package:dartz/dartz.dart';
import 'package:sdfsdf/core/errors/app_error.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/entity/sujra_entity.dart';

abstract class SujraRepository {
  Future<Either<AppError, List<SujraEntity>>> getSujraSharif();
}


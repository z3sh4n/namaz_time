import 'package:dartz/dartz.dart';
import '../../../../core/errors/app_error.dart';
import '../entity/sujra_entity.dart';

abstract class SujraRepository {
  Future<Either<AppError, List<SujraEntity>>> getSujraSharif();
}


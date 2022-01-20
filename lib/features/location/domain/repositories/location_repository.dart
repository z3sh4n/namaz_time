import 'package:dartz/dartz.dart';
import 'package:sdfsdf/core/errors/app_error.dart';
import 'package:sdfsdf/features/location/domain/entities/location_entity.dart';

abstract class LocationRepository {
  Future<Either<AppError, LocationEntity>> getlocation();
}

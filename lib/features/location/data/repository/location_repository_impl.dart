import 'package:dartz/dartz.dart';
import 'package:sdfsdf/core/errors/app_error.dart';
import 'package:sdfsdf/features/location/data/datasource/location_datasource.dart';
import 'package:sdfsdf/features/location/domain/entities/location_entity.dart';
import 'package:sdfsdf/features/location/domain/repositories/location_repository.dart';

class LocationRepositoryImpl extends LocationRepository {
  final LocationDataSource locationDataSource;

  LocationRepositoryImpl(this.locationDataSource);
  @override
  Future<Either<AppError, LocationEntity>> getlocation() async {
    try {
      final location = await locationDataSource.getLocation();
      return Right(LocationEntity(
          latitude: location.latitude.toDouble(),
          longitude: location.longitude.toDouble()));
    } on Exception {
      return const Left(AppError('error in location'));
    }
  }
}

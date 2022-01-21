import 'package:dartz/dartz.dart';
import '../../../../core/errors/app_error.dart';
import '../datasource/location_datasource.dart';
import '../../domain/entities/location_entity.dart';
import '../../domain/repositories/location_repository.dart';

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

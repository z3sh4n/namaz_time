import 'package:dartz/dartz.dart';
import 'package:sdfsdf/core/errors/app_error.dart';
import 'package:sdfsdf/core/usecase/no_params.dart';
import 'package:sdfsdf/core/usecase/usecase.dart';
import 'package:sdfsdf/features/location/domain/entities/location_entity.dart';
import 'package:sdfsdf/features/location/domain/repositories/location_repository.dart';

class GetLocation extends Usecase<LocationEntity, NoParams> {
  final LocationRepository locationRepository;

  GetLocation({required this.locationRepository});

  @override
  Future<Either<AppError, LocationEntity>> call(NoParams params) async {
    return await locationRepository.getlocation();
  }
}

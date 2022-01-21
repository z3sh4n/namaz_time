import 'package:dartz/dartz.dart';
import '../../../../core/errors/app_error.dart';
import '../../../../core/usecase/no_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/location_entity.dart';
import '../repositories/location_repository.dart';

class GetLocation extends Usecase<LocationEntity, NoParams> {
  final LocationRepository locationRepository;

  GetLocation({required this.locationRepository});

  @override
  Future<Either<AppError, LocationEntity>> call(NoParams params) async {
    return await locationRepository.getlocation();
  }
}

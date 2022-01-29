import 'package:dartz/dartz.dart';
import 'package:namaz_time/core/errors/app_error.dart';
import 'package:namaz_time/core/usecase/sujra_fb_params.dart';
import 'package:namaz_time/core/usecase/usecase.dart';
import 'package:namaz_time/features/sujra_sharif/domain/repository/sujra_fb_repository.dart';

class GetSujraFB extends Usecase<void, SujraFBParams> {
  final SujraFireBaseRepo sujraRepository;

  GetSujraFB(this.sujraRepository);

  @override
  // ignore: avoid_renaming_method_parameters
  Future<Either<AppError, void>> call(SujraFBParams name) async {
    return await sujraRepository.getSujraFromFirebase(name.name);
  }
}

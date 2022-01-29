import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sdfsdf/core/errors/app_error.dart';
import 'package:sdfsdf/core/usecase/sujra_fb_params.dart';
import 'package:sdfsdf/core/usecase/usecase.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/repository/sujra_fb_repository.dart';

class GetSujraFB extends Usecase<void, SujraFBParams> {
  final SujraFireBaseRepo sujraRepository;

  GetSujraFB(this.sujraRepository);

  @override
  // ignore: avoid_renaming_method_parameters
  Future<Either<AppError, void>> call(SujraFBParams name) async {
    return await sujraRepository.getSujraFromFirebase(name.name);
  }
}

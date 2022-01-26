import 'package:sdfsdf/core/errors/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:sdfsdf/features/sujra_sharif/data/datasource/sujra_firebase_datasouce.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/repository/sujra_fb_repository.dart';

class SujraFireBaseRepoImpl extends SujraFireBaseRepo {
  final SujraFirebaseDatasource firebaseDatasource;

  SujraFireBaseRepoImpl(this.firebaseDatasource);

  @override
  Future<Either<AppError, String>> getSujraFromFirebase(String name) async {
    try {
      final filePath = await firebaseDatasource.getSujraFromFirebase(name);
      return Right(filePath);
    } on Exception {
      return const Left(AppError('some error in SujraFireBaseRepoImpl'));
    }
  }
}

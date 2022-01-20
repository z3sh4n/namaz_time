import 'package:dartz/dartz.dart';
import 'package:sdfsdf/core/errors/app_error.dart';
import 'package:sdfsdf/features/sujra_sharif/data/datasource/sujra_datasource.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/entity/sujra_entity.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/repository/sujra_repository.dart';

class SujraRepositoryImpl extends SujraRepository {
  final SujraDataSource sujraDataSource;

  SujraRepositoryImpl(this.sujraDataSource);

  @override
  Future<Either<AppError, List<SujraEntity>>> getSujraSharif() async {
    try {
      final sujraList = await sujraDataSource.getSujraSharif();
      return Right(sujraList);
    } on Exception {
      return const Left(AppError('some error in getSujraRepoImpl'));
    }
  }
}

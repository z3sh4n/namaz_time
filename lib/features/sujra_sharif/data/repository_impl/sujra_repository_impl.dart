import 'package:dartz/dartz.dart';
import '../../../../core/errors/app_error.dart';
import '../datasource/sujra_datasource.dart';
import '../../domain/entity/sujra_entity.dart';
import '../../domain/repository/sujra_repository.dart';

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

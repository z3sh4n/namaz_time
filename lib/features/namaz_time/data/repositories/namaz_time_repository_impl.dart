import 'package:dartz/dartz.dart';
import 'package:sdfsdf/core/errors/app_error.dart';
import 'package:sdfsdf/features/namaz_time/data/datasources/namaz_remote_datasource.dart';
import 'package:sdfsdf/features/namaz_time/domain/entities/namaz_time_entity.dart';
import 'package:sdfsdf/features/namaz_time/domain/repositories/namaz_time_repository.dart';

class NamazTimeRepositoryImpl extends NamazTimeRepository {
  final NamazRemoteDataSource remoteDataSource;

  NamazTimeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<NamazTimeEntity>>> getNamazTimeList(
      double lat, double long) async {
    try {
      final namazList = await remoteDataSource.getNamazTime(lat, long);
      return Right(namazList);
    } on Exception {
      return const Left(AppError('some error in getNamazTimerepoImpl'));
    }
  }
}

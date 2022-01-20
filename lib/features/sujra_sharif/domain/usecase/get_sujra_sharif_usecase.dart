import 'package:dartz/dartz.dart';
import 'package:sdfsdf/core/errors/app_error.dart';
import 'package:sdfsdf/core/usecase/no_params.dart';
import 'package:sdfsdf/core/usecase/usecase.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/entity/sujra_entity.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/repository/sujra_repository.dart';

class GetSujraSharifList extends Usecase<List<SujraEntity>, NoParams> {
  final SujraRepository sujraRepository;

  GetSujraSharifList(this.sujraRepository);

  @override
  // ignore: avoid_renaming_method_parameters
  Future<Either<AppError, List<SujraEntity>>> call(NoParams noParams) async {
    return await sujraRepository.getSujraSharif();
  }
}

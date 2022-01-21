import 'package:dartz/dartz.dart';
import '../../../../core/errors/app_error.dart';
import '../../../../core/usecase/no_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/sujra_entity.dart';
import '../repository/sujra_repository.dart';

class GetSujraSharifList extends Usecase<List<SujraEntity>, NoParams> {
  final SujraRepository sujraRepository;

  GetSujraSharifList(this.sujraRepository);

  @override
  // ignore: avoid_renaming_method_parameters
  Future<Either<AppError, List<SujraEntity>>> call(NoParams noParams) async {
    return await sujraRepository.getSujraSharif();
  }
}

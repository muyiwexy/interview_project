import 'package:dartz/dartz.dart';
import 'package:interview_project/features/3_score_app/data/model/momentum_model.dart';

import '../../../../core/error/failure.dart';
import '../repository/three_score_app_repository.dart';

class GetMomentumData {
  late final ThreeScoreAppRepository threeScoreAppRepository;
  GetMomentumData(this.threeScoreAppRepository);

  Future<Either<Failure, MomentumModel>?>? execute() async {
    return await threeScoreAppRepository.getMomentumData();
  }
}

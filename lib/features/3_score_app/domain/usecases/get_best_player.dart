import 'package:dartz/dartz.dart';
import 'package:interview_project/features/3_score_app/data/model/best_player_model.dart';

import '../../../../core/error/failure.dart';
import '../repository/three_score_app_repository.dart';

class GetBestPlayer {
  late final ThreeScoreAppRepository threeScoreAppRepository;
  GetBestPlayer(this.threeScoreAppRepository);

  Future<Either<Failure, BestPlayerModel>?>? execute() async {
    return await threeScoreAppRepository.getBestPlayer();
  }
}

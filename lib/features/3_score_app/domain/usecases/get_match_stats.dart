import 'package:dartz/dartz.dart';
import 'package:interview_project/features/3_score_app/data/model/match_stats_models.dart';

import '../../../../core/error/failure.dart';
import '../repository/three_score_app_repository.dart';

class GetMatchStats {
  late final ThreeScoreAppRepository threeScoreAppRepository;
  GetMatchStats(this.threeScoreAppRepository);

  Future<Either<Failure, MatchStatsModel>?>? execute() async {
    return await threeScoreAppRepository.getMatchStatsData();
  }
}

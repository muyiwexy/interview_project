import 'package:dartz/dartz.dart';
import 'package:interview_project/features/3_score_app/data/model/match.dart';

import '../../../../core/error/failure.dart';
import '../repository/three_score_app_repository.dart';

class GetMatchInfo {
  late final ThreeScoreAppRepository threeScoreAppRepository;
  GetMatchInfo(this.threeScoreAppRepository);

  Future<Either<Failure, MatchModel>?>? execute() async {
    return await threeScoreAppRepository.getMatchInfo();
  }
}

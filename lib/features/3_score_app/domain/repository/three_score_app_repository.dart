import 'package:dartz/dartz.dart';
import 'package:interview_project/features/3_score_app/data/model/best_player_model.dart';
import 'package:interview_project/features/3_score_app/data/model/highlight_model.dart';
import 'package:interview_project/features/3_score_app/data/model/incident.dart';
import 'package:interview_project/features/3_score_app/data/model/match.dart';
import 'package:interview_project/features/3_score_app/data/model/match_stats_models.dart';
import 'package:interview_project/features/3_score_app/data/model/momentum_model.dart';
import 'package:interview_project/features/3_score_app/data/model/sample_logo.dart';

import '../../../../core/error/failure.dart';

abstract class ThreeScoreAppRepository {
  Future<Either<Failure, RootIncident>>? getIncidentData();
  Future<Either<Failure, Logo>>? getSampleLogo();
  Future<Either<Failure, MatchModel>>? getMatchInfo();
  Future<Either<Failure, HighlightModel>>? getVideoHighLights();
  Future<Either<Failure, BestPlayerModel>>? getBestPlayer();
  Future<Either<Failure, MomentumModel>>? getMomentumData();
  Future<Either<Failure, MatchStatsModel>>? getMatchStatsData();
}

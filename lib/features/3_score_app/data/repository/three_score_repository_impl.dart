import 'package:dartz/dartz.dart';
import 'package:interview_project/core/error/failure.dart';
import 'package:interview_project/features/3_score_app/data/datasources/three_score_local_data.dart';
import 'package:interview_project/features/3_score_app/data/model/best_player_model.dart';
import 'package:interview_project/features/3_score_app/data/model/highlight_model.dart';
import 'package:interview_project/features/3_score_app/data/model/incident.dart';
import 'package:interview_project/features/3_score_app/data/model/match.dart';
import 'package:interview_project/features/3_score_app/data/model/match_stats_models.dart';
import 'package:interview_project/features/3_score_app/data/model/momentum_model.dart';
import 'package:interview_project/features/3_score_app/data/model/sample_logo.dart';
import 'package:interview_project/features/3_score_app/domain/repository/three_score_app_repository.dart';

import '../../../../core/error/exceptions.dart';

class ThreeScoreAppRepositoryImpl extends ThreeScoreAppRepository {
  final ThreeScoreLocalDataSource threeScoreLocalDataSource;

  ThreeScoreAppRepositoryImpl({required this.threeScoreLocalDataSource});

  @override
  Future<Either<Failure, RootIncident>> getIncidentData() async {
    try {
      final incidentData = await threeScoreLocalDataSource.getIncidentData();
      return Right(incidentData!);
    } on JsonParseException catch (_) {
      return Left(JsonParseFailure());
    } on FileNotFoundException catch (_) {
      return Left(FileNotFoundFailure());
    } on PermissionDeniedException catch (_) {
      return Left(PermissionDeniedFailure());
    } on ReadException catch (_) {
      return Left(ReadFailure());
    } catch (e) {
      return Left(ReadFailure());
    }
  }

  @override
  Future<Either<Failure, Logo>>? getSampleLogo() async {
    try {
      final sampleLogo = await threeScoreLocalDataSource.getSampleLogo();
      return Right(sampleLogo!);
    } on JsonParseException catch (_) {
      return Left(JsonParseFailure());
    } on FileNotFoundException catch (_) {
      return Left(FileNotFoundFailure());
    } on PermissionDeniedException catch (_) {
      return Left(PermissionDeniedFailure());
    } on ReadException catch (_) {
      return Left(ReadFailure());
    } catch (e) {
      return Left(ReadFailure());
    }
  }

  @override
  Future<Either<Failure, MatchModel>>? getMatchInfo() async {
    try {
      final matchInfo = await threeScoreLocalDataSource.getMatchInfo();
      return Right(matchInfo!);
    } on JsonParseException catch (_) {
      return Left(JsonParseFailure());
    } on FileNotFoundException catch (_) {
      return Left(FileNotFoundFailure());
    } on PermissionDeniedException catch (_) {
      return Left(PermissionDeniedFailure());
    } on ReadException catch (_) {
      return Left(ReadFailure());
    } catch (e) {
      return Left(ReadFailure());
    }
  }

  @override
  Future<Either<Failure, HighlightModel>>? getVideoHighLights() async {
    try {
      final videoHighlight =
          await threeScoreLocalDataSource.getVideoHighLights();
      return Right(videoHighlight!);
    } on JsonParseException catch (_) {
      return Left(JsonParseFailure());
    } on FileNotFoundException catch (_) {
      return Left(FileNotFoundFailure());
    } on PermissionDeniedException catch (_) {
      return Left(PermissionDeniedFailure());
    } on ReadException catch (_) {
      return Left(ReadFailure());
    } catch (e) {
      return Left(ReadFailure());
    }
  }

  @override
  Future<Either<Failure, BestPlayerModel>>? getBestPlayer() async {
    try {
      final bestPlayer = await threeScoreLocalDataSource.getBestPlayer();
      return Right(bestPlayer!);
    } on JsonParseException catch (_) {
      return Left(JsonParseFailure());
    } on FileNotFoundException catch (_) {
      return Left(FileNotFoundFailure());
    } on PermissionDeniedException catch (_) {
      return Left(PermissionDeniedFailure());
    } on ReadException catch (_) {
      return Left(ReadFailure());
    } catch (e) {
      return Left(ReadFailure());
    }
  }

  @override
  Future<Either<Failure, MatchStatsModel>>? getMatchStatsData() async {
    try {
      final matchStats = await threeScoreLocalDataSource.getMatchStats();
      return Right(matchStats!);
    } on JsonParseException catch (_) {
      return Left(JsonParseFailure());
    } on FileNotFoundException catch (_) {
      return Left(FileNotFoundFailure());
    } on PermissionDeniedException catch (_) {
      return Left(PermissionDeniedFailure());
    } on ReadException catch (_) {
      return Left(ReadFailure());
    } catch (e) {
      return Left(ReadFailure());
    }
  }

  @override
  Future<Either<Failure, MomentumModel>>? getMomentumData() async {
    try {
      final momentumData = await threeScoreLocalDataSource.getMomentumData();
      return Right(momentumData!);
    } on JsonParseException catch (_) {
      return Left(JsonParseFailure());
    } on FileNotFoundException catch (_) {
      return Left(FileNotFoundFailure());
    } on PermissionDeniedException catch (_) {
      return Left(PermissionDeniedFailure());
    } on ReadException catch (_) {
      return Left(ReadFailure());
    } catch (e) {
      return Left(ReadFailure());
    }
  }
}

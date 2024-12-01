import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_project/features/3_score_app/data/model/best_player_model.dart';
import 'package:interview_project/features/3_score_app/data/model/highlight_model.dart';
import 'package:interview_project/features/3_score_app/data/model/match_stats_models.dart';
import 'package:interview_project/features/3_score_app/data/model/momentum_model.dart';
import 'package:interview_project/features/3_score_app/domain/usecases/get_best_player.dart';
import 'package:interview_project/features/3_score_app/domain/usecases/get_match_stats.dart';
import 'package:interview_project/features/3_score_app/domain/usecases/get_momentum_data.dart';
import 'package:interview_project/features/3_score_app/domain/usecases/get_video_highlight.dart';

import '../../../../../core/error/failure.dart';
import '../../../data/model/match.dart';
import '../../../data/model/sample_logo.dart';
import '../../../domain/usecases/get_match_info.dart';
import '../../../domain/usecases/get_sample_logo.dart';

part 'match_data_event.dart';
part 'match_data_state.dart';

class MatchDataBloc extends Bloc<MatchDataEvent, MatchDataState> {
  final GetSampleLogo getSampleLogo;
  final GetMatchInfo getMatchInfo;
  final GetVideoHighlight getVideoHighlight;
  final GetBestPlayer getBestPlayer;
  final GetMomentumData getMomentumData;
  final GetMatchStats getMatchStats;

  MatchDataBloc(
      {required this.getSampleLogo,
      required this.getMatchInfo,
      required this.getVideoHighlight,
      required this.getBestPlayer,
      required this.getMomentumData,
      required this.getMatchStats})
      : super(MatchDataInitial()) {
    on<FetchMatchData>((event, emit) async {
      emit(MatchDataLoading());

      final Either<Failure, Logo>? result = await getSampleLogo.execute();
      final Either<Failure, MatchModel>? match = await getMatchInfo.execute();
      final Either<Failure, HighlightModel>? highLight =
          await getVideoHighlight.execute();
      final Either<Failure, BestPlayerModel>? bestPlayer =
          await getBestPlayer.execute();
      final Either<Failure, MatchStatsModel>? matchStats =
          await getMatchStats.execute();
      final Either<Failure, MomentumModel>? momentumData =
          await getMomentumData.execute();

      result?.fold(
        (failure) => emit(MatchDataError(_mapFailureToMessage(failure))),
        (logo) => match?.fold(
          (failure) => emit(MatchDataError(_mapFailureToMessage(failure))),
          (matchInfo) => highLight?.fold(
            (failure) => emit(
              MatchDataError(
                _mapFailureToMessage(failure),
              ),
            ),
            (highlight) => bestPlayer?.fold(
                (failure) => emit(
                      MatchDataError(
                        _mapFailureToMessage(failure),
                      ),
                    ),
                (bestplayer) => momentumData?.fold(
                      (failure) => MatchDataError(
                        _mapFailureToMessage(failure),
                      ),
                      (momentum) => matchStats?.fold(
                        (failure) =>
                            MatchDataError(_mapFailureToMessage(failure)),
                        (stats) => emit(
                          MatchDataLoaded(logo, matchInfo, highlight,
                              bestplayer, momentum, stats),
                        ),
                      ),
                    )),
          ),
        ),
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (JsonParseFailure):
        return "Error parsing data.";
      case const (FileNotFoundFailure):
        return "Data file not found.";
      case const (PermissionDeniedFailure):
        return "Permission denied.";
      case const (ReadFailure):
        return "Error reading data.";
      default:
        return "Unexpected error.";
    }
  }
}

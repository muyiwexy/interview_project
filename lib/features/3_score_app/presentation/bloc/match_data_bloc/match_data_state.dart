part of 'match_data_bloc.dart';

sealed class MatchDataState extends Equatable {
  const MatchDataState();

  @override
  List<Object> get props => [];
}

class MatchDataInitial extends MatchDataState {}

class MatchDataLoading extends MatchDataState {}

class MatchDataLoaded extends MatchDataState {
  final Logo logo;
  final MatchModel match;
  final HighlightModel highlightModel;
  final BestPlayerModel bestPlayerModel;
  final MomentumModel momentumModel;
  final MatchStatsModel matchStatsModel;

  const MatchDataLoaded(this.logo, this.match, this.highlightModel,
      this.bestPlayerModel, this.momentumModel, this.matchStatsModel);

  @override
  List<Object> get props =>
      [logo, match, highlightModel, momentumModel, matchStatsModel];
}

class MatchDataError extends MatchDataState {
  final String message;

  const MatchDataError(this.message);

  @override
  List<Object> get props => [message];
}

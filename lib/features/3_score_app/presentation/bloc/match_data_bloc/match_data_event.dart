part of 'match_data_bloc.dart';

sealed class MatchDataEvent extends Equatable {
  const MatchDataEvent();

  @override
  List<Object> get props => [];
}

class FetchMatchData extends MatchDataEvent {}

part of 'season_bloc.dart';

@immutable
abstract class SeasonState{
  const SeasonState();
}

class SeasonInitialState extends SeasonState {}


class SeasonLoadingState extends SeasonState {}

class SeasonLoadedState extends SeasonState {
  final List<Season> seasonList;

  const SeasonLoadedState({required this.seasonList});
}

class SeasonErrorState extends SeasonState {}

part of 'season_bloc.dart';

@immutable
abstract class SeasonState {
  const SeasonState();
}

class SeasonInitialState extends SeasonState {}

class SeasonLoadingState extends SeasonState {}

class SeasonLoadedState extends SeasonState {
  const SeasonLoadedState({required this.seasonList});

  final List<Season> seasonList;
}

class SeasonErrorState extends SeasonState {}

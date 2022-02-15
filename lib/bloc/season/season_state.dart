part of 'season_bloc.dart';

///Bloc Abstract Season State which lets you create events on behalf of it. 
@immutable
abstract class SeasonState {
  ///Constructor
  const SeasonState();
}
///State that fires for  the first time
class SeasonInitialState extends SeasonState {}
///State  that lets you know when something is loading
class SeasonLoadingState extends SeasonState {}
///State that informs you that all season data has been loaded
class SeasonLoadedState extends SeasonState {
  ///Constructor that takes a list of seasons
  const SeasonLoadedState({required this.seasonList});
  ///Property
  final List<Season> seasonList;
}
///State that is fired if an error occurs
class SeasonErrorState extends SeasonState {}

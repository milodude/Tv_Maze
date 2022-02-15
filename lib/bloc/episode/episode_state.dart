part of 'episode_bloc.dart';

///Bloc Abstract Episode State which lets you create events on behalf of it. 
abstract class EpisodeState extends Equatable {
  ///Constructor
  const EpisodeState();

  @override
  List<Object> get props => <Object>[];
}

///Episode Initial State 
class EpisodeInitialState extends EpisodeState {}

///State that loads the required episodes
class EpisodeLoadingState extends EpisodeState {}

///State that acknoledges that the episodes were loaded already
class EpisodeLoadedState extends EpisodeState {
  ///Constructor that takes a list of episodes.
  const EpisodeLoadedState({required this.episodeList});
  ///List of episodes. 
  final List<Episode>? episodeList;
}
///State that is fired if  an error occurs
class EpisodeErrorState extends EpisodeState {}

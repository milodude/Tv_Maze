part of 'episode_bloc.dart';

abstract class EpisodeState extends Equatable {
  const EpisodeState();
  
  @override
  List<Object> get props => [];
}

class EpisodeInitialState extends EpisodeState {}


class EpisodeLoadingState extends EpisodeState {}

class EpisodeLoadedState extends EpisodeState {
  final List<Episode>? episodeList;

  const EpisodeLoadedState({required this.episodeList});
}

class EpisodeErrorState extends EpisodeState {}


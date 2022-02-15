part of 'episode_bloc.dart';

abstract class EpisodeState extends Equatable {
  const EpisodeState();

  @override
  List<Object> get props => [];
}

class EpisodeInitialState extends EpisodeState {}

class EpisodeLoadingState extends EpisodeState {}

class EpisodeLoadedState extends EpisodeState {
  const EpisodeLoadedState({required this.episodeList});
  
  final List<Episode>? episodeList;
}

class EpisodeErrorState extends EpisodeState {}

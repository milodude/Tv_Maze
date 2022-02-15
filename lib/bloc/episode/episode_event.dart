part of 'episode_bloc.dart';

abstract class EpisodeEvent extends Equatable {
  const EpisodeEvent();

  @override
  List<Object> get props => [];
}

class LoadEpisodeDataEvent extends EpisodeEvent {
  const LoadEpisodeDataEvent(this.id);
  
  final int id;

  @override
  List<Object> get props => [];
}

class ClearEpisodesEvent extends EpisodeEvent {
  @override
  List<Object> get props => [];
}

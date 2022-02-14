part of 'episode_bloc.dart';

abstract class EpisodeEvent extends Equatable {
  const EpisodeEvent();

  @override
  List<Object> get props => [];
}

class LoadEpisodeDataEvent extends EpisodeEvent{
 
  final int id;

  const LoadEpisodeDataEvent(this.id);
}

part of 'episode_bloc.dart';
///Abstract class Episode Event. Allows  you to create events on behalf of it 
///to use it in the bloc.
abstract class EpisodeEvent extends Equatable {
  ///Constructor
  const EpisodeEvent();

  @override
  List<Object> get props => <Object>[];
}

///Episode Event: Loads episodes for the corresponing season Id
class LoadEpisodeDataEvent extends EpisodeEvent {
  ///Constructor
  const LoadEpisodeDataEvent(this.seasonId);
  ///Season Id you need to load the episodes.
  final int seasonId;

  @override
  List<Object> get props => <Object>[];
}

///Episode event that clears all  of the previous results.
class ClearEpisodesEvent extends EpisodeEvent {
  @override
  List<Object> get props => <Object>[];
}

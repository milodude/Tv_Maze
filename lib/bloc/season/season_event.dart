part of 'season_bloc.dart';

///Season abstract class that lets you create new events for a season
abstract class SeasonEvent extends Equatable {
  ///constructor
  const SeasonEvent();

  @override
  List<Object> get props => <Object>[];
}

///Event that loads all seasons for a show
class LoadSeasonDataEvent extends SeasonEvent {
  ///constructor that takes a show Id
  const LoadSeasonDataEvent(this.showId);
  ///Parameter show Id
  final int showId;

  @override
  List<Object> get props => <Object>[];
}

///Season event to clear all of the result.
class ClearSeasonEvent extends SeasonEvent {
  @override
  List<Object> get props => <Object>[];
}

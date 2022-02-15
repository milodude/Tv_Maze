part of 'season_bloc.dart';

abstract class SeasonEvent extends Equatable {
  const SeasonEvent();

  @override
  List<Object> get props => [];
}

class LoadSeasonDataEvent extends SeasonEvent {
  const LoadSeasonDataEvent(this.id);
  final int id;

  @override
  List<Object> get props => [];
}

class ClearSeasonEvent extends SeasonEvent {
  @override
  List<Object> get props => [];
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tv_maze/models/season.dart';
import 'package:tv_maze/services/season_service.dart';

part 'season_event.dart';
part 'season_state.dart';

///Season Bloc that handles the events
class SeasonBloc extends Bloc<SeasonEvent, SeasonState> {
  ///Constructor which takes a Season Service as a parameter
  SeasonBloc(this.seasonService) : super(SeasonInitialState()) {
    on<SeasonEvent>((SeasonEvent event, Emitter<SeasonState> emit) async {
      if (event is ClearSeasonEvent) {
        emit(const SeasonLoadedState(seasonList: <Season>[]));
      }

      if (event is LoadSeasonDataEvent) {
        emit(SeasonLoadingState());
        List<Season>? seasonList = await seasonService.getSeasons(event.showId);
        seasonList == null
            ? emit(SeasonErrorState())
            : emit(SeasonLoadedState(seasonList: seasonList));
      }
    });
  }
  
  ///Season service that lets you make  API request  
  final SeasonService seasonService;
}

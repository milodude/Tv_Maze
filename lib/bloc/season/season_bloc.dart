import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tv_maze/models/season.dart';
import 'package:tv_maze/services/season_service.dart';

part 'season_event.dart';
part 'season_state.dart';

class SeasonBloc extends Bloc<SeasonEvent, SeasonState> {
  final SeasonService seasonService;

  SeasonBloc(this.seasonService) : super(SeasonInitialState()) {
    on<SeasonEvent>((event, emit) async{
       if(event is ClearSeasonEvent) {
        emit( const SeasonLoadedState(seasonList: []));
      }

      if(event is LoadSeasonDataEvent){
        emit(SeasonLoadingState());
        List<Season>? seasonList = await seasonService.getSeasons(event.id);
        seasonList == null ? emit(SeasonErrorState()) : emit(SeasonLoadedState(seasonList: seasonList));
      }
    });
  }
}

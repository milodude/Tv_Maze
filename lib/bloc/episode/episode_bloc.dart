import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_maze/models/episode.dart';
import 'package:tv_maze/services/episode_service.dart';

part 'episode_event.dart';
part 'episode_state.dart';
///Bloc for managing Episode states
class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  ///Constructor.Parameter episodeService is required.
  EpisodeBloc(this._episodeService) : super(EpisodeInitialState()) {
    on<EpisodeEvent>((EpisodeEvent event, Emitter<EpisodeState> emit) async {
      if (event is ClearEpisodesEvent) {
        emit(const EpisodeLoadedState(episodeList: <Episode>[]));
      }

      if (event is LoadEpisodeDataEvent) {
        emit(EpisodeLoadingState());
        List<Episode>? episodeList = await _episodeService.getEpisodes(event.seasonId);
        emit(EpisodeLoadedState(episodeList: episodeList));
      }
    });
  }

  final EpisodeService _episodeService;
}

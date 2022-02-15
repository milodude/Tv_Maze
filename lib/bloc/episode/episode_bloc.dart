import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_maze/models/episode.dart';
import 'package:tv_maze/services/episode_service.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final EpisodeService episodeService;

  EpisodeBloc(this.episodeService) : super(EpisodeInitialState()) {
    on<EpisodeEvent>((event, emit) async {
      if (event is ClearEpisodesEvent) {
        emit(const EpisodeLoadedState(episodeList: []));
      }

      if (event is LoadEpisodeDataEvent) {
        emit(EpisodeLoadingState());
        var episodeList = await episodeService.getEpisodes(event.id);
        emit(EpisodeLoadedState(episodeList: episodeList));
      }
    });
  }
}

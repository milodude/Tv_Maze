import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tv_maze/models/show.dart';
import 'package:tv_maze/services/show_service.dart';

part 'show_event.dart';
part 'show_state.dart';

///Bloc for managing Episode states
class ShowBloc extends Bloc<ShowEvent, ShowState> {
  ///Constructor.Parameter showService is required.
  ShowBloc(this.showService) : super(ShowInitialState()) {
    on<ShowEvent>((ShowEvent event, Emitter<ShowState> emit) async {
      if (event is LoadShowDataEvent) {
        emit(ShowLoadingState());
        List<Show>? showList = await showService.getShows();

        showList == null
            ? emit(ShowErrorState())
            : emit(ShowListLoadedState(showList: showList));
      }

      if (event is LoadShowSearchDataEvent) {
        emit(ShowLoadingState());
        List<Show>? showList = await showService.searchShows(event.query);
        showList == null
            ? emit(ShowErrorState())
            : emit(ShowListLoadedState(showList: showList));
      }

      if (event is LoadShowDetailsEvent) {
        emit(ShowLoadingState());
        Show? show = await showService.searchShow(event.id);
        show == null
            ? emit(ShowErrorState())
            : emit(ShowLoadedState(show: show));
      }
    });
  }
  ///Property
  final ShowService showService;

}

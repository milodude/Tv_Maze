part of 'show_bloc.dart';

@immutable
abstract class ShowState {}

class ShowInitialState extends ShowState {}

class ShowLoadingState extends ShowState {}

class ShowListLoadedState extends ShowState {
  final List<Show> showList;

  ShowListLoadedState({required this.showList});
}

class ShowLoadedState extends ShowState {
  final Show show;

  ShowLoadedState({required this.show});
}

class ShowErrorState extends ShowState {}

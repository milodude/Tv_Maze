part of 'show_bloc.dart';

@immutable
abstract class ShowState {}

class ShowInitialState extends ShowState {}

class ShowLoadingState extends ShowState {}

class ShowListLoadedState extends ShowState {
  ShowListLoadedState({required this.showList});
  final List<Show> showList;

}

class ShowLoadedState extends ShowState {
  ShowLoadedState({required this.show});
  final Show show;

}

class ShowErrorState extends ShowState {}

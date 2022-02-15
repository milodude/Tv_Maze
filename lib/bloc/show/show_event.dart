part of 'show_bloc.dart';

@immutable
abstract class ShowEvent extends Equatable {}

class LoadShowDataEvent extends ShowEvent {
  @override
  List<Object?> get props => [];
}

class LoadShowSearchDataEvent extends ShowEvent {
  LoadShowSearchDataEvent({required this.query});
  final String query;

  @override
  List<Object> get props => [];
}

class LoadShowDetailsEvent extends ShowEvent {
  LoadShowDetailsEvent({required this.id});
  final int id;

  @override
  List<Object> get props => [];
}

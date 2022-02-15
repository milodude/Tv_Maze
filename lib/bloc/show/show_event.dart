part of 'show_bloc.dart';

@immutable
abstract class ShowEvent extends Equatable {}

class LoadShowDataEvent extends ShowEvent {
  @override
  List<Object?> get props => [];
}

class LoadShowSearchDataEvent extends ShowEvent {
  final String query;

  LoadShowSearchDataEvent({required this.query});
  @override
  List<Object> get props => [];
}

class LoadShowDetailsEvent extends ShowEvent {
  final int id;

  LoadShowDetailsEvent({required this.id});
  @override
  List<Object> get props => [];
}

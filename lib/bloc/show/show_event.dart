part of 'show_bloc.dart';
///Abstract class Show Event. Allows you to create events on behalf of it to use
/// it in the bloc.
@immutable
abstract class ShowEvent extends Equatable {}
///Episode Event: Loads Shows available
class LoadShowDataEvent extends ShowEvent {
  @override
  List<Object?> get props => <Object>[];
}

///Event  that happens when 
class LoadShowSearchDataEvent extends ShowEvent {
  ///Event that handles the show search
  LoadShowSearchDataEvent({required this.query});
  ///Parameter  to  execute the query for the search
  final String query;

  @override
  List<Object> get props => <Object>[];
}

///Event that handles the show details
class LoadShowDetailsEvent extends ShowEvent {
  ///Constructor which takes a show Id
  LoadShowDetailsEvent({required this.id});
  ///Property Show id
  final int id;

  @override
  List<Object> get props => <Object>[];
}

part of 'shows_bloc.dart';

abstract class ShowsEvent extends Equatable {
  const ShowsEvent();
}

class GetShowsEvent extends ShowsEvent {
  const GetShowsEvent();

  @override
  List<Object?> get props => [];
}

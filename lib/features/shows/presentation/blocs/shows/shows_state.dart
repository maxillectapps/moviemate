part of 'shows_bloc.dart';

class ShowsState extends Equatable {
  const ShowsState();

  @override
  List<Object> get props => [];
}

final class ShowsInitial extends ShowsState {}

final class ShowsLoading extends ShowsState {}

final class ShowsLoaded extends ShowsState {
  final List<TvShow>? shows;

  const ShowsLoaded({this.shows});

  @override
  List<Object> get props => [shows!];
}

final class ShowsLoadingError extends ShowsState {
  final String message;
  const ShowsLoadingError({required this.message});

  @override
  List<Object> get props => [message];
}

import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_mate/core/resources/data_state.dart';
import 'package:movie_mate/features/shows/data/repository/show_repository_impl.dart';
import 'package:movie_mate/features/shows/domain/usecases/get_shows.dart';

import '../../../data/data.dart';

part 'shows_state.dart';
part 'shows_event.dart';

class ShowsBloc extends Bloc<ShowsEvent, ShowsState> {
  late GetShowsUseCase _getShowsUseCase;

  ShowsBloc() : super(ShowsInitial()) {
    _getShowsUseCase =
        GetShowsUseCase(ShowRepositoryImpl(ShowsApiServiceImpl()));
    on<ShowsEvent>((event, emit) async {
      emit(ShowsLoading());

      final dataState = await _getShowsUseCase(Void);

      if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
        emit(ShowsLoaded(shows: dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(ShowsLoadingError(
            message: dataState.error?.message ?? 'Something went wrong!'));
      }
    });
  }
}

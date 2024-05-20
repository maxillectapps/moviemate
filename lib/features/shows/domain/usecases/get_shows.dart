import 'package:movie_mate/core/resources/data_state.dart';
import 'package:movie_mate/core/usercase/usecase.dart';
import 'package:movie_mate/features/shows/data/data.dart';
import 'package:movie_mate/features/shows/domain/domain.dart';

class GetShowsUseCase implements UseCase<DataState<List<TvShow>>, void> {
  final ShowRepository _showRepository;

  GetShowsUseCase(this._showRepository);

  @override
  Future<DataState<List<TvShow>>> call(void params) {
    return _showRepository.getShows();
  }
}

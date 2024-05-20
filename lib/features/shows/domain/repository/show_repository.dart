import 'package:movie_mate/core/resources/data_state.dart';

import '../../data/data.dart';

abstract class ShowRepository {
  Future<DataState<List<TvShow>>> getShows();
}

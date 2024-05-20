import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movie_mate/core/resources/data_state.dart';
import 'package:movie_mate/features/shows/domain/domain.dart';

import '../data.dart';

class ShowRepositoryImpl implements ShowRepository {
  final ShowsApiService _showsApiService;

  ShowRepositoryImpl(this._showsApiService);

  @override
  Future<DataState<List<TvShow>>> getShows() async {
    try {
      final response = await _showsApiService.getShows();

      if (response.statusCode == HttpStatus.ok) {
        return DataSuccess(tvShowsFromJson(response.data));
      } else {
        throw DioException(
            error: response.statusMessage,
            response: response,
            type: DioExceptionType.badResponse,
            requestOptions: response.requestOptions);
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}

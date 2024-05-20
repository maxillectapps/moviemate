import 'package:dio/dio.dart';
import 'package:movie_mate/core/services/dio_service.dart';

abstract class ShowsApiService {
  Future<Response> getShows();
}

class ShowsApiServiceImpl implements ShowsApiService {
  @override
  Future<Response> getShows() async {
    DioService dio = DioService();
    final response = await dio.getRequest('/search/shows?q=spiderman');
    return response;
  }
}

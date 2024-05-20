import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_mate/core/core.dart';

class DioService {
  late Dio _dio;

  DioService({Map<String, dynamic>? headers}) {
    _dio = Dio(BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: headers,
      contentType: 'application/json',
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 20000),
      sendTimeout: const Duration(milliseconds: 20000),
      maxRedirects: 5,
    ));

    initializeInterceptor();
  }

  dynamic _handleDioError(DioException e) {
    if (kDebugMode) {
      print('Dio error: ${e.response!.data['message']}');
    }
    // Example: Handle specific HTTP error codes
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 400:
          return e.response!.data['message'];
        case 401:
          return 'Unauthorized';
        case 403:
          return 'Forbidden';
        case 404:
          return 'Not found';
        case 500:
          return 'Internal server error';
        case 502:
          return 'Internal server error';
        default:
          return 'Something went wrong';
      }
    } else {
      return 'Request Timeout.Please try again';
    }
  }

  dynamic _handleGenericError(e) {
    if (kDebugMode) {
      print('Unexpected error: $e');
    }
    throw e; // Rethrow the exception or handle it as you see fit.
  }

  Future<Response> getRequest(String endpoint,
      {Map<String, dynamic>? headers}) async {
    try {
      Response response =
          await _dio.get(endpoint, options: Options(headers: headers));
      if (kDebugMode) {
        print(response.data);
      }
      return response;
    } on DioException catch (e) {
      // Handle Dio error and return a custom error response
      throw _handleDioError(e);
    } catch (e) {
      // Handle generic error and return a custom error response
      throw _handleGenericError(e);
    }
  }

  initializeInterceptor() {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      return handler.next(options);
    }, onResponse: (response, handler) async {
      return handler.next(response);
    }, onError: (DioException e, handler) async {
      return handler.next(e);
    }));
  }
}

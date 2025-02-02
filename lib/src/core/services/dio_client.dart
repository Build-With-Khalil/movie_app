import 'package:dio/dio.dart';
import 'package:movie_app/src/core/services/errors_handler.dart';
import 'package:movie_app/src/core/services/interceptor.dart';

import '../utils/constants/app_urls.dart';
import 'http_client.dart';

class DioClient implements HttpClient {
  final Dio _dio;

  DioClient(this._dio) {
    /// Initialize Dio with base options
    _dio.options = BaseOptions(
      baseUrl: AppUrls.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    /// Add interceptors
    _dio.interceptors.add(CustomInterceptors());
  }

  @override
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw DioErrorHandler.handleError(e);
    }
  }

  @override
  Future<Response> post(String path, {dynamic data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } on DioException catch (e) {
      throw DioErrorHandler.handleError(e);
    }
  }

  @override
  Future<Response> put(String path, {dynamic data}) async {
    try {
      final response = await _dio.put(path, data: data);
      return response;
    } on DioException catch (e) {
      throw DioErrorHandler.handleError(e);
    }
  }

  @override
  Future<Response> delete(String path) async {
    try {
      final response = await _dio.delete(path);
      return response;
    } on DioException catch (e) {
      throw DioErrorHandler.handleError(e);
    }
  }
}

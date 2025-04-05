import 'package:dio/dio.dart';
import 'package:movie_app/src/core/services/errors_handler.dart';
import 'package:movie_app/src/core/services/interceptor.dart';

import 'base_class.dart';

class DioService extends BaseClass {
  DioService(BaseOptions baseOptions) : super(options: baseOptions) {
    dio.interceptors.add(CustomInterceptors());
  }

  @override
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw DioErrorHandler.handleError(e);
    }
  }

  @override
  Future<Response> post(String path, dynamic data) async {
    try {
      final response = await dio.post(
        path,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      throw DioErrorHandler.handleError(e);
    }
  }

  @override
  Future<Response> put(String path, dynamic data) async {
    try {
      final response = await dio.put(
        path,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      throw DioErrorHandler.handleError(e);
    }
  }

  @override
  Future<Response> delete(String path) async {
    try {
      final response = await dio.delete(
        path,
      );
      return response;
    } on DioException catch (e) {
      throw DioErrorHandler.handleError(e);
    }
  }
}

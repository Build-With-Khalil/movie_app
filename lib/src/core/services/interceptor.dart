import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/src/core/services/errors_handler.dart';
import 'package:movie_app/src/core/services/storage/token_storage.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    /// Add authorization token or other headers
    if (kDebugMode) {
      print(options.headers['Authorization'] = await TokenStorage.getToken());
    }
    if (kDebugMode) {
      print('Request: ${options.method} ${options.path}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('Response: ${response.statusCode} ${response.statusMessage}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    /// Use centralized error handler
    final errorMessage = DioErrorHandler.handleError(err);
    if (kDebugMode) {
      print('Error: $errorMessage');
    }
    super.onError(err, handler);
  }
}

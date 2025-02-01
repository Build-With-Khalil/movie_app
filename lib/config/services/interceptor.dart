import 'package:dio/dio.dart';
import 'package:movie_app/config/services/errors_handler.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// Add authorization token or other headers
    options.headers['Authorization'] = 'Bearer your_token_here';
    print('Request: ${options.method} ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Response: ${response.statusCode} ${response.statusMessage}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    /// Use centralized error handler
    final errorMessage = DioErrorHandler.handleError(err);
    print('Error: $errorMessage');
    super.onError(err, handler);
  }
}

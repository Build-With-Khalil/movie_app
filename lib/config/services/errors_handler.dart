import 'package:dio/dio.dart';

class DioErrorHandler {
  /// Handle DioException and return error message
  static String handleError(DioException error) {
    String errorMessage = 'Something went wrong!';

    if (error.type == DioExceptionType.connectionTimeout) {
      errorMessage =
          'Connection timeout. Please check your internet connection.';
    } else if (error.type == DioExceptionType.sendTimeout) {
      errorMessage = 'Request sending timeout. Please try again.';
    } else if (error.type == DioExceptionType.receiveTimeout) {
      errorMessage = 'Response timeout. Please try again.';
    } else if (error.type == DioExceptionType.badResponse) {
      /// Handle HTTP error status codes
      if (error.response != null) {
        errorMessage = _handleStatusCode(error.response!);
      }
    } else if (error.type == DioExceptionType.cancel) {
      errorMessage = 'Request was cancelled.';
    } else {
      errorMessage = 'An unknown error occurred.';
    }

    return errorMessage;
  }

  /// Handle HTTP error status codes
  static String _handleStatusCode(Response response) {
    switch (response.statusCode) {
      case 400:
        return 'Bad request. Please check your input.';
      case 401:
        return 'Unauthorized. Please log in again.';
      case 403:
        return 'Forbidden. You do not have permission to access this resource.';
      case 404:
        return 'Resource not found.';
      case 500:
        return 'Internal server error. Please try again later.';
      default:
        return 'Error: ${response.statusCode} - ${response.statusMessage}';
    }
  }
}

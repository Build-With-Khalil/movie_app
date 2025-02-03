import 'package:movie_app/src/core/utils/enum/enums.dart';

class ApiResponse<T> {
  PostAPIStatus? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = PostAPIStatus.loading;

  ApiResponse.completed(this.data) : status = PostAPIStatus.success;

  ApiResponse.error(this.message) : status = PostAPIStatus.error;
  @override
  String toString() {
    return 'ApiResponse{status: $status, data: $data, message: $message}';
  }
}

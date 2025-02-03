import 'package:dio/dio.dart';

abstract class BaseClass {
  final Dio dio;

  BaseClass({BaseOptions? options}) : dio = Dio(options);

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters});

  Future<Response> post(String path, dynamic data);

  Future<Response> put(String path, dynamic data);

  Future<Response> delete(String path);
}

import 'package:dio/dio.dart';
import 'package:movie_app/src/core/services/dio_services.dart';

import '../../../../../core/utils/constants/app_urls.dart';
import '../model/user/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    final dio = DioService(
      BaseOptions(
        baseUrl: AppUrls.baseUrl1,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    try {
      final response = await dio.post(
        AppUrls.endPoint1,
        {
          'email': email,
          'password': password,
        },
      );
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to login');
    }
  }
}

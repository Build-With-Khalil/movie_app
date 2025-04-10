import 'package:dio/dio.dart';
import 'package:movie_app/src/features/auth_module/data/model/user/sign_up_model.dart';

import '../../../../core/services/dio_services.dart';
import '../../../../core/utils/constants/app_urls.dart';
import '../model/user/login_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login(String email, String password);

  Future<SignUpModel> signUp(
    String name,
    String surName,
    String email,
    String phoneNumber,
    String password,
  );
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<LoginModel> login(String email, String password) async {
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
      return LoginModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to login');
    }
  }

  @override
  Future<SignUpModel> signUp(
    String name,
    String surName,
    String email,
    String phoneNumber,
    String password,
  ) async {
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
        AppUrls.endPoint2,
        {
          'name': name,
          'surName': surName,
          'email': email,
          'phoneNumber': phoneNumber,
          'password': password,
        },
      );
      return SignUpModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to Signup');
    }
  }
}

import 'package:dio/dio.dart';
import 'package:movie_app/src/core/utils/constants/app_urls.dart';
import 'package:movie_app/src/features/auth_module/login/data/model/user/user_model.dart';

import '../../../../../core/services/dio_services.dart';

class LoginRepository {
  Future<UserModel> login(dynamic data) async {
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
    final response = await dio.post(AppUrls.endPoint1, data);
    return UserModel.fromJson(response.data);
  }
}

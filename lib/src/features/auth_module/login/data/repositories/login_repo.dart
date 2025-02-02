import 'package:movie_app/src/core/utils/constants/app_urls.dart';
import 'package:movie_app/src/features/auth_module/login/data/model/user/user_model.dart';

import '../../../../../core/services/dio_client.dart';

class LoginRepository {
  final DioClient _dioClient;

  LoginRepository(this._dioClient);

  Future<UserModel> login(dynamic data) async {
    final response = await _dioClient.post(AppUrls.baseUrl, data: data);
    return UserModel.fromJson(response.data);
  }
}

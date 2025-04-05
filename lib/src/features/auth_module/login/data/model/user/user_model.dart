import 'package:movie_app/src/features/auth_module/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String token;

  UserModel({required this.token}) : super(token: token);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json['token'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}

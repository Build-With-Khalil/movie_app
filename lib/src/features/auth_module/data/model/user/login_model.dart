import '../../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  final String token;

  LoginModel({required this.token}) : super(token: token);

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json['token'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}

import '../../../domain/entities/sign_up_entity.dart';

class SignUpModel extends SignUpEntity {
  const SignUpModel({super.id, super.token});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        id: json['id'] ?? 0,
        token: json['token'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'token': token,
      };
}

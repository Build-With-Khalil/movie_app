import '../../../domain/entities/sign_up_entity.dart';

class SignUpModel extends SignUpEntity {
  final int? id;
  final String? token;

  SignUpModel({this.id, this.token}) : super(id: id, token: token);

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        id: json['id'] ?? 0,
        token: json['token'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'token': token,
      };
}

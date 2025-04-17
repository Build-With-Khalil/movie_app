class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});

  factory LoginParams.fromJson(Map<String, dynamic> json) => LoginParams(
        email: json['email'] ?? '',
        password: json['password'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}

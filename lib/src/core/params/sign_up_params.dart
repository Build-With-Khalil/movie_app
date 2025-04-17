class SignUpParams {
  final String name;
  final String surName;
  final String email;
  final String phoneNumber;
  final String password;

  SignUpParams({
    required this.name,
    required this.surName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  factory SignUpParams.fromJson(Map<String, dynamic> json) => SignUpParams(
        name: json['name'] ?? '',
        surName: json['surName'] ?? '',
        email: json['email'] ?? '',
        phoneNumber: json['phoneNumber'] ?? '',
        password: json['password'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'surName': surName,
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password,
      };
}

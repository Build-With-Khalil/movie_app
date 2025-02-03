part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email, password, message;
  final PostAPIStatus postApiStatus;
  final bool isObscure;

  const LoginState({
    this.email = '',
    this.password = '',
    this.message = '',
    this.isObscure = false,
    this.postApiStatus = PostAPIStatus.initial,
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? message,
    bool? isObscure,
    PostAPIStatus? postApiStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      isObscure: isObscure ?? this.isObscure,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        message,
        isObscure,
        postApiStatus,
      ];
}

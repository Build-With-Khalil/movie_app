part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email, password, message;
  final PostAPIStatus postApiStatus;

  const LoginState({
    this.email = '',
    this.password = '',
    this.message = '',
    this.postApiStatus = PostAPIStatus.initial,
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? message,
    PostAPIStatus? postApiStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        message,
        postApiStatus,
      ];
}

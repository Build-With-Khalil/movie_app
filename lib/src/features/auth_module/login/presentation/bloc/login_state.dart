part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email, password, error;
  final PostAPIStatus postApiStatus;

  const LoginState({
    this.email = '',
    this.password = '',
    this.error = '',
    this.postApiStatus = PostAPIStatus.initial,
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? error,
    PostAPIStatus? postApiStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        error,
        postApiStatus,
      ];
}

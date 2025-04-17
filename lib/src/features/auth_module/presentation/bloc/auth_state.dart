part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final PostAPIStatus postApiStatus;
  final String message;
  final String token;

  const AuthState({
    this.token = '',
    this.message = '',
    this.postApiStatus = PostAPIStatus.initial,
  });

  AuthState copyWith({
    String? token,
    String? message,
    PostAPIStatus? postApiStatus,
  }) {
    return AuthState(
      token: token ?? this.token,
      message: message ?? this.message,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object?> get props => [
        token,
        message,
        postApiStatus,
      ];
}

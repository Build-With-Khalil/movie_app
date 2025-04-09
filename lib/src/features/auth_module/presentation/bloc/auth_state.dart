part of 'auth_bloc.dart';

//
// class AuthState extends Equatable {
//   final String email, password, message;
//   final PostAPIStatus postApiStatus;
//   final bool isObscure;
//   final UserEntity user;
//
//   const AuthState(
//     this.user, {
//     this.email = '',
//     this.password = '',
//     this.message = '',
//     this.isObscure = false,
//     this.postApiStatus = PostAPIStatus.initial,
//   });
//
//   AuthState copyWith({
//     String? email,
//     String? password,
//     String? message,
//     bool? isObscure,
//     PostAPIStatus? postApiStatus,
//     UserEntity? user,
//   }) {
//     return AuthState(
//       user ?? this.user,
//       email: email ?? this.email,
//       password: password ?? this.password,
//       message: message ?? this.message,
//       isObscure: isObscure ?? this.isObscure,
//       postApiStatus: postApiStatus ?? this.postApiStatus,
//     );
//   }
//
//   @override
//   List<Object> get props => [
//         email,
//         password,
//         message,
//         isObscure,
//         postApiStatus,
//         user,
//       ];
// }
//
// class AuthLoading extends AuthState {
//   const AuthLoading(super.user);
// }

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  final PostAPIStatus postApiStatus;

  AuthInitial({
    this.postApiStatus = PostAPIStatus.initial,
  });

  AuthInitial copyWith({
    PostAPIStatus? postApiStatus,
  }) {
    return AuthInitial(postApiStatus: postApiStatus ?? this.postApiStatus);
  }

  @override
  List<Object?> get props => [postApiStatus];
}

class AuthLoading extends AuthState {
  final PostAPIStatus postApiStatus;

  AuthLoading({
    this.postApiStatus = PostAPIStatus.loading,
  });

  AuthLoading copyWith({PostAPIStatus? postApiStatus}) {
    return AuthLoading(
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object?> get props => [postApiStatus];
}

class AuthSuccess extends AuthState {
  final String token;
  final PostAPIStatus postApiStatus;

  AuthSuccess({
    this.token = '',
    this.postApiStatus = PostAPIStatus.success,
  });

  AuthSuccess copyWith({
    String? token,
    PostAPIStatus? postApiStatus,
  }) {
    return AuthSuccess(
      token: token ?? this.token,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object?> get props => [
        token,
        postApiStatus,
      ];
}

class AuthError extends AuthState {
  final String message;
  final PostAPIStatus postApiStatus;

  AuthError({
    this.message = '',
    this.postApiStatus = PostAPIStatus.error,
  });

  AuthError copyWith({
    String? message,
    PostAPIStatus? postApiStatus,
  }) {
    return AuthError(
      message: message ?? this.message,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object?> get props => [
        message,
        postApiStatus,
      ];
}

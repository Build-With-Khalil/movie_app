part of 'login_bloc.dart';

//
// class LoginState extends Equatable {
//   final String email, password, message;
//   final PostAPIStatus postApiStatus;
//   final bool isObscure;
//   final UserEntity user;
//
//   const LoginState(
//     this.user, {
//     this.email = '',
//     this.password = '',
//     this.message = '',
//     this.isObscure = false,
//     this.postApiStatus = PostAPIStatus.initial,
//   });
//
//   LoginState copyWith({
//     String? email,
//     String? password,
//     String? message,
//     bool? isObscure,
//     PostAPIStatus? postApiStatus,
//     UserEntity? user,
//   }) {
//     return LoginState(
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
// class LoginLoading extends LoginState {
//   const LoginLoading(super.user);
// }

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
  final PostAPIStatus postApiStatus;

  LoginInitial({this.postApiStatus = PostAPIStatus.initial});

  LoginInitial copyWith({PostAPIStatus? postApiStatus}) {
    return LoginInitial(postApiStatus: postApiStatus ?? this.postApiStatus);
  }

  @override
  List<Object?> get props => [postApiStatus];
}

class LoginLoading extends LoginState {
  final PostAPIStatus postApiStatus;

  LoginLoading({this.postApiStatus = PostAPIStatus.loading});

  LoginLoading copyWith({PostAPIStatus? postApiStatus}) {
    return LoginLoading(postApiStatus: postApiStatus ?? this.postApiStatus);
  }

  @override
  List<Object?> get props => [postApiStatus];
}

class LoginSuccess extends LoginState {
  final String token;
  final PostAPIStatus postApiStatus;

  LoginSuccess({this.token = '', this.postApiStatus = PostAPIStatus.success});

  LoginSuccess copyWith({
    String? token,
    PostAPIStatus? postApiStatus,
  }) {
    return LoginSuccess(
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

class LoginError extends LoginState {
  final String message;
  final PostAPIStatus postApiStatus;

  LoginError({this.message = '', this.postApiStatus = PostAPIStatus.error});

  LoginError copyWith({
    String? message,
    PostAPIStatus? postApiStatus,
  }) {
    return LoginError(
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

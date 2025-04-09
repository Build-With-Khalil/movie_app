part of 'auth_bloc.dart';

// abstract class AuthEvent extends Equatable {
//   const AuthEvent();
//
//   @override
//   List<Object> get props => [];
// }
//
// class AuthRequested extends AuthEvent {
//   final String email;
//   final String password;
//
//   const AuthRequested({required this.email, required this.password});
//
//   @override
//   List<Object> get props => [email, password];
// }
//
// class EmailChanged extends AuthEvent {
//   final String email;
//
//   const EmailChanged({
//     required this.email,
//   });
//
//   @override
//   List<Object> get props => [email];
// }
//
// class EmailUnfocused extends AuthEvent {}
//
// class PasswordChanged extends AuthEvent {
//   final String password;
//
//   const PasswordChanged({
//     required this.password,
//   });
//
//   @override
//   List<Object> get props => [password];
// }
//
// class PasswordUnfocused extends AuthEvent {}
//
// class VisibleEye extends AuthEvent {}
//
// class AuthApiCall extends AuthEvent {}

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

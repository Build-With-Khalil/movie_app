part of 'login_bloc.dart';

// abstract class LoginEvent extends Equatable {
//   const LoginEvent();
//
//   @override
//   List<Object> get props => [];
// }
//
// class LoginRequested extends LoginEvent {
//   final String email;
//   final String password;
//
//   const LoginRequested({required this.email, required this.password});
//
//   @override
//   List<Object> get props => [email, password];
// }
//
// class EmailChanged extends LoginEvent {
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
// class EmailUnfocused extends LoginEvent {}
//
// class PasswordChanged extends LoginEvent {
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
// class PasswordUnfocused extends LoginEvent {}
//
// class VisibleEye extends LoginEvent {}
//
// class LoginApiCall extends LoginEvent {}

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginRequested extends LoginEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

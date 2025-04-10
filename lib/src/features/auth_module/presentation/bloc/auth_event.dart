part of 'auth_bloc.dart';

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

class SignUpRequested extends AuthEvent {
  final String name;
  final String surName;
  final String email;
  final String phoneNumber;
  final String password;

  SignUpRequested({
    required this.name,
    required this.surName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  @override
  List<Object?> get props => [
        name,
        surName,
        email,
        phoneNumber,
        password,
      ];
}

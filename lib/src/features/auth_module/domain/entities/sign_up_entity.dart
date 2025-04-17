import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  final int? id;
  final String? token;

  const SignUpEntity({this.id, this.token});

  @override
  List<Object?> get props => [
        id,
        token,
      ];
}

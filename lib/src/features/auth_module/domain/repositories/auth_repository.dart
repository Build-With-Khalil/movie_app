import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entities/login_entity.dart';
import '../entities/sign_up_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> login(
    String email,
    String password,
  );

  Future<Either<Failure, SignUpEntity>> signUp(
    String name,
    String surName,
    String email,
    String phoneNumber,
    String password,
  );
}

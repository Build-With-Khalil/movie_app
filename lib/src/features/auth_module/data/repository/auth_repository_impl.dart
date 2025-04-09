import 'package:dartz/dartz.dart';
import 'package:movie_app/src/features/auth_module/domain/entities/sign_up_entity.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, LoginEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final user = await authRemoteDataSource.login(email, password);
      return Right(user);
    } catch (e) {
      return Left(Failure(message: 'Login Failed'));
    }
  }

  @override
  Future<Either<Failure, SignUpEntity>> signUp(
    String name,
    String surName,
    String email,
    String phoneNumber,
    String password,
  ) async {
    try {
      final user = await authRemoteDataSource.signUp(
        name,
        surName,
        email,
        phoneNumber,
        password,
      );
      return Right(user);
    } catch (e) {
      return Left(Failure(message: 'Sign Up Failed'));
    }
  }
}

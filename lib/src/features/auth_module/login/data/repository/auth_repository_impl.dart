import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/failure/failure.dart';
import 'package:movie_app/src/features/auth_module/login/domain/entities/user_entity.dart';
import 'package:movie_app/src/features/auth_module/login/domain/repositories/auth_repository.dart';

import '../data_source/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> login(
      String email, String password) async {
    try {
      final user = await authRemoteDataSource.login(email, password);
      return Right(user);
    } catch (e) {
      return Left(Failure(message: 'Login Failed'));
    }
  }
}

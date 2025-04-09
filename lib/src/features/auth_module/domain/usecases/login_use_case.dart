import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/params/login_params.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/login_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase implements UseCase<LoginEntity, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, LoginEntity>> call(LoginParams params) {
    return repository.login(
      params.email,
      params.password,
    );
  }
}

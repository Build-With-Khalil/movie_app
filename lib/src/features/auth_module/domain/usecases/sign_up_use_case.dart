import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/failure/failure.dart';
import 'package:movie_app/src/core/use_case/use_case.dart';
import 'package:movie_app/src/features/auth_module/domain/entities/sign_up_entity.dart';

import '../../../../core/params/sign_up_params.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase implements UseCase<SignUpEntity, SignUpParams> {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  @override
  Future<Either<Failure, SignUpEntity>> call(SignUpParams params) {
    return repository.signUp(
      params.name,
      params.surName,
      params.email,
      params.phoneNumber,
      params.password,
    );
  }
}

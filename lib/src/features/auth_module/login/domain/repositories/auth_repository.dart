import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';
import '../../domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
}

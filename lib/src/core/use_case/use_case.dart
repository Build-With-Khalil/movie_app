import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/failure/failure.dart';

/// Abstract class for all use cases to ensure consistency.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

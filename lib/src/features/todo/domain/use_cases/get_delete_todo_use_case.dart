import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/failure/failure.dart';
import 'package:movie_app/src/core/use_case/use_case.dart';

import '../repository/todo_repository.dart';

class GetDeleteTodoUseCase implements UseCase<void, String> {
  final TodoRepository repository;

  GetDeleteTodoUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String id) async {
    return await repository.deleteTodo(id);
  }
}

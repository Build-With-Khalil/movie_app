import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/failure/failure.dart';
import 'package:movie_app/src/core/params/todo_params.dart';
import 'package:movie_app/src/core/use_case/use_case.dart';
import 'package:movie_app/src/features/todo/domain/entities/todo_entity.dart';

import '../repository/todo_repository.dart';

class GetAddTodoUseCase extends UseCase<TodoListEntity, TodoParams> {
  final TodoRepository repository;

  GetAddTodoUseCase(this.repository);

  @override
  Future<Either<Failure, TodoListEntity>> call(TodoParams params) async {
    return await repository.postTodo(params);
  }
}

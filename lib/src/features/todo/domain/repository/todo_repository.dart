import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/params/todo_params.dart';

import '../../../../core/failure/failure.dart';
import '../entities/todo_entity.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<TodoListEntity>>> getTodoList();

  Future<Either<Failure, TodoListEntity>> postTodo(TodoParams params);

  Future<Either<Failure, TodoListEntity>> updateTodo(TodoParams params);

  Future<Either<Failure, void>> deleteTodo(String id);
}

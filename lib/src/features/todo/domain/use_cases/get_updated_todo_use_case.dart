import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/failure/failure.dart';
import 'package:movie_app/src/core/use_case/use_case.dart';

import '../../../../core/params/todo_params.dart';
import '../entities/todo_entity.dart';
import '../repository/todo_repository.dart';

class GetUpdatedTodoUseCase extends UseCase<TodoListEntity, TodoParams> {
  final TodoRepository todoRepository;

  GetUpdatedTodoUseCase(this.todoRepository);

  @override
  Future<Either<Failure, TodoListEntity>> call(TodoParams params) async {
    return await todoRepository.updateTodo(params);
  }
}

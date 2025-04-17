import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/failure/failure.dart';
import 'package:movie_app/src/core/use_case/no_params.dart';
import 'package:movie_app/src/core/use_case/use_case.dart';
import 'package:movie_app/src/features/todo/domain/entities/todo_entity.dart';

import '../repository/todo_repository.dart';

class GetTodoListUseCase extends UseCase<List<TodoListEntity>, NoParams> {
  final TodoRepository todoRepository;

  GetTodoListUseCase(this.todoRepository);

  @override
  Future<Either<Failure, List<TodoListEntity>>> call(NoParams params) async {
    return await todoRepository.getTodoList();
  }
}

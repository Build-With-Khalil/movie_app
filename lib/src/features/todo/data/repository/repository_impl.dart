import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/params/todo_params.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/repository/todo_repository.dart';
import '../data_source/remote_data_source.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource todoRemoteDataSource;

  TodoRepositoryImpl(this.todoRemoteDataSource);

  @override
  Future<Either<Failure, List<TodoListEntity>>> getTodoList() async {
    try {
      final result = await todoRemoteDataSource.getApi();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodoListEntity>> postTodo(TodoParams params) async {
    try {
      final result = await todoRemoteDataSource.postData(params);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodoListEntity>> updateTodo(TodoParams params) async {
    try {
      final result = await todoRemoteDataSource.updateTodo(params);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTodo(String id) async {
    try {
      final result = await todoRemoteDataSource.delete(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

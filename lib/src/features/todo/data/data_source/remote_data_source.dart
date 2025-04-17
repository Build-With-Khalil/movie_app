import 'package:dio/dio.dart';
import 'package:movie_app/src/core/params/todo_params.dart';
import 'package:movie_app/src/features/todo/domain/entities/todo_entity.dart';

import '../../../../core/services/dio_services.dart';
import '../../../../core/utils/constants/app_urls.dart';
import '../models/todo_model.dart';

abstract class TodoRemoteDataSource {
  Future<List<TodoListModel>> getApi();

  Future<TodoListEntity> postData(TodoParams params);

  Future<TodoListEntity> updateTodo(TodoParams params);

  Future<void> delete(String id);
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  @override
  Future<List<TodoListModel>> getApi() async {
    final dio = DioService(
      BaseOptions(
        baseUrl: AppUrls.baseUrl3,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );
    try {
      final response = await dio.get(
        AppUrls.endPoint3,
      );
      final data = response.data as List;

      return data.map((e) => TodoListModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to fetch todo');
    }
  }

  @override
  Future<TodoListEntity> postData(TodoParams params) async {
    try {
      final dio = DioService(
        BaseOptions(
          baseUrl: AppUrls.baseUrl3,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      final response = await dio.post(
        AppUrls.endPoint3,
        {
          'title': params.title,
          'description': params.description,
        },
      );
      return TodoListModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to add todo');
    }
  }

  @override
  Future<TodoListEntity> updateTodo(TodoParams params) async {
    final dio = DioService(
      BaseOptions(
        baseUrl: AppUrls.baseUrl3,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 1),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    try {
      final response = await dio.put(
        '${AppUrls.endPoint3}/${params.id}',
        params.toJson(),
      );
      return TodoListModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to edit todo');
    }
  }

  @override
  Future<void> delete(String id) async {
    final dio = DioService(
      BaseOptions(
        baseUrl: AppUrls.baseUrl3,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 1),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    try {
      await dio.delete('${AppUrls.endPoint3}/$id');
    } catch (e) {
      throw Exception('Failed to delete todo');
    }
  }
}

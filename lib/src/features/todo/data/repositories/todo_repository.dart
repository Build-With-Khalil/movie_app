import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/src/features/todo/data/models/todo_model.dart';

import '../../../../core/services/dio_services.dart';
import '../../../../core/utils/constants/app_urls.dart';

class TodoListApiRepository {
  Future<List<TodoListModel>> getApi() async {
    final dio = DioService(
      BaseOptions(
        baseUrl: AppUrls.baseUrl3,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 1),
      ),
    );
    final response = await dio.get(
      AppUrls.endPoint3,
    );
    final data = response.data as List;
    if (kDebugMode) {
      print("API Raw Response: ${data.toString()}");
    }
    return data.map((e) => TodoListModel.fromJson(e)).toList();
  }

  Future<TodoListModel> postData(dynamic data) async {
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
    final response = await dio.post(AppUrls.endPoint3, data);
    if (kDebugMode) {
      print("API Raw Response: ${response.data.toString()}");
    }
    return response.data;
  }

  Future<void> edit(String id, TodoListModel updatedTodo) async {
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

    final response = await dio.put(
      '${AppUrls.endPoint3}/$id',
      {
        "title": updatedTodo.title,
        "description": updatedTodo.description,
        "isCompleted": updatedTodo.isCompleted,
      },
    );
    return response.data;
  }

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

    final response = await dio.delete(
      '${AppUrls.endPoint3}/$id',
    );
    return response.data;
  }
}

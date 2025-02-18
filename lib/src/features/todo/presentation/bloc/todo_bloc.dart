import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/src/features/todo/data/models/todo_model.dart';
import 'package:movie_app/src/features/todo/data/repositories/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<FetchTodoListEvent>(_fetchTodoList);
    on<AddTodoEvent>(_addTodo);
  }

  Future<void> _fetchTodoList(
    FetchTodoListEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(state.copyWith(listLoader: true, listError: ""));
    try {
      final todoList = await TodoListApiRepository().getApi();
      emit(
        state.copyWith(
          todoList: todoList,
          listLoader: false,
          listError: "",
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          listLoader: false,
          listError: e.toString(),
        ),
      );
    }
  }

  Future<void> _addTodo(
    AddTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(
      state.copyWith(
        submitLoader: true,
        submitError: "",
      ),
    );
    try {
      Map<String, dynamic> data = {
        "title": event.title,
        "description": event.description,
      };

      log("Title Event: ${event.title}");

      final result = await TodoListApiRepository().postData(data);
      log("Result:${result.toString()}");
      emit(
        state.copyWith(
          submitLoader: false,
          submitError: "",
          todoList: [...state.todoList!, result],
        ),
      );
      print("✅ Todo added successfully");
      Navigator.pop(navigatorKey.currentContext!);
    } catch (e) {
      log(e.toString());
      emit(
        state.copyWith(
          submitLoader: false,
          submitError: e.toString(),
        ),
      );
    }
  }
}

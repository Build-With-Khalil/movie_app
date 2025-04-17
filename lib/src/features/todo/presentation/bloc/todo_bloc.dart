import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/src/features/todo/domain/entities/todo_entity.dart';
import 'package:movie_app/src/features/todo/domain/use_cases/get_updated_todo_use_case.dart';

import '../../../../core/params/todo_params.dart';
import '../../../../core/use_case/no_params.dart';
import '../../../../core/utils/enum/enums.dart';
import '../../domain/use_cases/add_todo_use_case.dart';
import '../../domain/use_cases/get_delete_todo_use_case.dart';
import '../../domain/use_cases/get_todo_list_use_case.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodoListUseCase getTodoListUseCase;
  final GetAddTodoUseCase getAddTodoUseCase;
  final GetUpdatedTodoUseCase getUpdateTodoUseCase;
  final GetDeleteTodoUseCase getDeleteTodoUseCase;

  TodoBloc(
    this.getTodoListUseCase,
    this.getAddTodoUseCase,
    this.getUpdateTodoUseCase,
    this.getDeleteTodoUseCase,
  ) : super(TodoState()) {
    on<FetchTodoListEvent>(_fetchTodoList);
    on<AddTodoEvent>(_addTodo);
    on<UpdateTodoEvent>(_updateTodo);
    on<DeleteTodoEvent>(_deleteTodo);
  }

  // Fetch Todo List
  Future<void> _fetchTodoList(
    FetchTodoListEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(state.copyWith(listLoader: true, listError: ""));
    try {
      final result = await getTodoListUseCase.call(NoParams());
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              listLoader: false,
              listError: failure.message,
            ),
          );
        },
        (todoList) {
          emit(
            state.copyWith(
              listLoader: false,
              todoList: todoList,
            ),
          );
          print("🔄 Todo List: ${state.todoList}");
        },
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

  // Add Todo
  Future<void> _addTodo(
    AddTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(
      state.copyWith(
        postApiStatus: PostAPIStatus.loading,
        errorMessage: '',
      ),
    );
    final result = await getAddTodoUseCase.call(
      TodoParams(
        title: event.title,
        description: event.description,
      ),
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            postApiStatus: PostAPIStatus.error,
            listLoader: false,
            errorMessage: failure.message,
          ),
        );
      },
      (todoEntity) {
        final updatedList = List<TodoListEntity>.from(state.todoList)
          ..add(todoEntity);
        emit(
          state.copyWith(
            postApiStatus: PostAPIStatus.success,
            todoList: updatedList,
          ),
        );
      },
    );
  }

  // Update Todo
  Future<void> _updateTodo(
    UpdateTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(
      state.copyWith(
        postApiStatus: PostAPIStatus.loading,
        errorMessage: '',
      ),
    );
    final result = await getUpdateTodoUseCase.call(event.updatedTodo);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            postApiStatus: PostAPIStatus.error,
            listLoader: false,
            errorMessage: failure.message,
          ),
        );
      },
      (updatedTodo) {
        // Update only the specific Todo at the correct index
        final updatedList = List<TodoListEntity>.from(state.todoList);
        final index =
            updatedList.indexWhere((todo) => todo.id == event.updatedTodo.id);
        if (index != -1) {
          updatedList[index] = updatedList[index].copyWith(
            title: event.updatedTodo.title,
            description: event.updatedTodo.description,
            isCompleted: event.updatedTodo.isCompleted,
          );
          print("🔄 Updated Todo: ${updatedList[index]}");
        }
        emit(
          state.copyWith(
            postApiStatus: PostAPIStatus.success,
            todoList: updatedList,
          ),
        );
      },
    );
  }

  Future<void> _deleteTodo(
    DeleteTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(state.copyWith(postApiStatus: PostAPIStatus.loading));
    final result = await getDeleteTodoUseCase.call(event.id);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            postApiStatus: PostAPIStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (_) {
        final updatedList = List<TodoListEntity>.from(state.todoList)
          ..removeWhere((todo) => todo.id == event.id);
        emit(
          state.copyWith(
            postApiStatus: PostAPIStatus.success,
            todoList: updatedList,
          ),
        );
      },
    );
  }
}

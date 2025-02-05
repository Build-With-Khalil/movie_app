import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/src/core/utils/enum/enums.dart';
import 'package:movie_app/src/features/todo/data/models/todo_model.dart';
import 'package:movie_app/src/features/todo/data/repositories/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoListApiRepository todoListApiRepository;

  TodoBloc({
    required this.todoListApiRepository,
  }) : super(
          TodoState(),
        ) {
    on<FetchTodosListEvent>(_fetchTodosList);
    on<TitleTodoEvent>(_titleTodoEvent);
    on<DescriptionTodoEvent>(_descriptionTodoEvent);
    on<SubmitingTodoEvent>(_onSubmitingTodoEvent);
    on<EditTodoEvent>(_onEditTodoEvent);
    on<DeleteTodoEvent>(_onDeleteTodoEvent);
  }

  Future<void> _fetchTodosList(
    FetchTodosListEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(state.copyWith(todoListModel: state.todoListModel));
    try {
      await todoListApiRepository.getApi().then(
        (value) {
          emit(
            state.copyWith(
              todoListModel: value,
              postAPIStatus: PostAPIStatus.success,
              message: "Success",
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          postAPIStatus: PostAPIStatus.error,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _titleTodoEvent(
    TitleTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(
      state.copyWith(
        title: event.title,
      ),
    );
  }

  Future<void> _descriptionTodoEvent(
    DescriptionTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(
      state.copyWith(
        description: event.description,
      ),
    );
  }

  Future<void> _onSubmitingTodoEvent(
    SubmitingTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    dynamic data = {
      "title": state.title,
      "description": state.description,
    };
    emit(
      state.copyWith(
        postAPIStatus: PostAPIStatus.loading,
      ),
    );
    await todoListApiRepository.postData(data).then(
      (value) {
        emit(
          state.copyWith(
            message: 'Data Entered',
            postAPIStatus: PostAPIStatus.success,
          ),
        );
      },
    ).onError(
      (error, stackTrace) {
        emit(
          state.copyWith(
            message: error.toString(),
            postAPIStatus: PostAPIStatus.error,
          ),
        );
      },
    );
  }

  Future<void> _onEditTodoEvent(
      EditTodoEvent event, Emitter<TodoState> emit) async {
    try {
      await todoListApiRepository.edit(event.id, event.updatedTodo);
      final updatedList = List<TodoListModel>.from(state.todoListModel);
      final index = updatedList.indexWhere((todo) => todo.id == event.id);

      if (index != -1) {
        updatedList[index] = event.updatedTodo;
      }

      emit(state.copyWith(
          todoListModel: updatedList, postAPIStatus: PostAPIStatus.success));
    } catch (e) {
      emit(state.copyWith(
          postAPIStatus: PostAPIStatus.error, message: e.toString()));
    }
  }

  Future<void> _onDeleteTodoEvent(
    DeleteTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      await todoListApiRepository.delete(event.id);

      // Fetch updated list after deletion
      final updatedTodos = await todoListApiRepository.getApi();

      emit(
        state.copyWith(
          todoListModel: updatedTodos,
          postAPIStatus: PostAPIStatus.success,
          message: "Todo deleted successfully!",
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          postAPIStatus: PostAPIStatus.error,
          message: "Failed to delete todo: $e",
        ),
      );
    }
  }
}

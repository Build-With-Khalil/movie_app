import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/src/core/utils/enum/enums.dart';
import 'package:movie_app/src/features/todo/data/models/todo_model.dart';
import 'package:movie_app/src/features/todo/data/repositories/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoListApiRepository todoListApiRepository;

  TodoBloc({required this.todoListApiRepository})
      : super(
          TodoState(),
        ) {
    on<FetchTodosListEvent>(_fetchTodosList);
    on<TitleTodoEvent>(_titleTodoEvent);
    on<DescriptionTodoEvent>(_descriptionTodoEvent);
    on<SubmitingTodoEvent>(_onSubmitingTodoEvent);
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
}

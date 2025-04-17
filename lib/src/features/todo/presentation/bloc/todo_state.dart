part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<TodoListEntity> todoList;
  final bool listLoader;
  final String listError;
  final PostAPIStatus postApiStatus;
  final String errorMessage;

  const TodoState({
    this.todoList = const <TodoListEntity>[],
    this.listLoader = false,
    this.listError = '',
    this.postApiStatus = PostAPIStatus.initial,
    this.errorMessage = '',
  });

  TodoState copyWith({
    List<TodoListEntity>? todoList,
    bool? listLoader,
    String? listError,
    PostAPIStatus? postApiStatus,
    String? errorMessage,
  }) {
    return TodoState(
      todoList: todoList ?? this.todoList,
      listLoader: listLoader ?? this.listLoader,
      listError: listError ?? this.listError,
      postApiStatus: postApiStatus ?? this.postApiStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        todoList,
        listLoader,
        listError,
        postApiStatus,
        errorMessage,
      ];
}

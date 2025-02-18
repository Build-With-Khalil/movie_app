part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<TodoListModel>? todoList;
  final bool listLoader, submitLoader;
  final String listError, submitError;

  const TodoState({
    this.todoList = const [],
    this.listLoader = false,
    this.submitLoader = false,
    this.listError = "",
    this.submitError = "",
  });

  TodoState copyWith({
    List<TodoListModel>? todoList,
    bool? listLoader,
    bool? submitLoader,
    String? listError,
    String? submitError,
  }) {
    return TodoState(
      todoList: todoList ?? this.todoList,
      listLoader: listLoader ?? this.listLoader,
      submitLoader: submitLoader ?? this.submitLoader,
      listError: listError ?? this.listError,
      submitError: submitError ?? this.submitError,
    );
  }

  @override
  List<Object?> get props => [
        todoList,
        listLoader,
        submitLoader,
        listError,
        submitError,
      ];
}

final class TodoInitial extends TodoState {}

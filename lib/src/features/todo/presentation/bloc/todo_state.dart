part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<TodoListModel> todoListModel;
  final PostAPIStatus postAPIStatus;
  final String message, title, description;

  /// Todo state
  const TodoState({
    this.title = '',
    this.description = '',
    this.postAPIStatus = PostAPIStatus.initial,
    this.message = '',
    this.todoListModel = const <TodoListModel>[],
  });

  TodoState copyWith({
    PostAPIStatus? postAPIStatus,
    String? message,
    String? title,
    String? description,
    List<TodoListModel>? todoListModel,
  }) {
    return TodoState(
      postAPIStatus: postAPIStatus ?? this.postAPIStatus,
      message: message ?? this.message,
      title: title ?? this.title,
      description: description ?? this.description,
      todoListModel: todoListModel ?? this.todoListModel,
    );
  }

  @override
  List<Object?> get props => [
        postAPIStatus,
        message,
        title,
        description,
        todoListModel,
      ];
}

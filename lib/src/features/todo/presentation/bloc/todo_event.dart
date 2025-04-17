part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchTodoListEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final String title;
  final String description;

  AddTodoEvent({
    required this.title,
    required this.description,
  });

  @override
  List<Object> get props => [title, description];
}

class UpdateTodoEvent extends TodoEvent {
  final TodoParams updatedTodo;

  UpdateTodoEvent(this.updatedTodo);

  @override
  List<Object> get props => [updatedTodo];
}

class DeleteTodoEvent extends TodoEvent {
  final String id;

  DeleteTodoEvent(this.id);

  @override
  List<Object> get props => [id];
}

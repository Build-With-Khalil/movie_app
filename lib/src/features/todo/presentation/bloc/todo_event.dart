part of 'todo_bloc.dart';

class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class FetchTodoListEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final String? title, description;

  const AddTodoEvent({this.title, this.description});

  @override
  List<Object?> get props => [title, description];
}

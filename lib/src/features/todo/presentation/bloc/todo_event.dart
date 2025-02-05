part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class FetchTodosListEvent extends TodoEvent {}

class TitleTodoEvent extends TodoEvent {
  final String title;
  const TitleTodoEvent(this.title);
  @override
  List<Object> get props => [title];
}

class DescriptionTodoEvent extends TodoEvent {
  final String description;

  const DescriptionTodoEvent(this.description);

  @override
  List<Object> get props => [description];
}

class SubmitingTodoEvent extends TodoEvent {}

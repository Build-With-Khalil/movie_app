import 'package:equatable/equatable.dart';

class TodoListEntity extends Equatable {
  final String? title;
  final String? description;
  final bool? isCompleted;
  final String? id;

  const TodoListEntity({
    this.title,
    this.description,
    this.isCompleted,
    this.id,
  });

  TodoListEntity copyWith({
    String? title,
    String? description,
    bool? isCompleted,
    String? id,
  }) {
    return TodoListEntity(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      id: id ?? this.id,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        title,
        description,
        isCompleted,
        id,
      ];
}

import '../../domain/entities/todo_entity.dart';

class TodoListModel extends TodoListEntity {
  const TodoListModel({
    super.id,
    super.title,
    super.description,
    super.isCompleted,
  });

  factory TodoListModel.fromJson(Map<String, dynamic> json) => TodoListModel(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        isCompleted: json['is_completed'] ?? true,
      );

  factory TodoListModel.fromEntity(TodoListEntity entity) {
    return TodoListModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      isCompleted: entity.isCompleted,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'is_completed': isCompleted,
        'id': id,
      };
}

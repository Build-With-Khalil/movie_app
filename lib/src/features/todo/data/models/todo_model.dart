class TodoListModel {
  final String? title;
  final String? description;
  final bool? isCompleted;
  final String? id;

  TodoListModel({
    this.title,
    this.description,
    this.isCompleted,
    this.id,
  });

  factory TodoListModel.fromJson(Map<String, dynamic> json) => TodoListModel(
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        isCompleted: json['is_completed'] ?? false,
        id: json['id'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'is_completed': isCompleted,
        'id': id,
      };
}

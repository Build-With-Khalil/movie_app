import 'package:equatable/equatable.dart';

class TodoParams extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final bool? isCompleted;

  const TodoParams({
    this.id,
    this.title,
    this.description,
    this.isCompleted = false,
  });

  factory TodoParams.fromJson(Map<String, dynamic> json) => TodoParams(
        title: json['title'] ?? '',
        description: json['description'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        description,
        isCompleted,
      ];
}

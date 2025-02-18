import 'package:flutter/material.dart';
import 'package:movie_app/src/features/todo/data/models/todo_model.dart';

void editTodoDialog(BuildContext context, TodoListModel todo) {
  final TextEditingController titleController =
      TextEditingController(text: todo.title);
  final TextEditingController descriptionController =
      TextEditingController(text: todo.description);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Edit Todo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final updatedTodo = TodoListModel(
                id: todo.id,
                title: titleController.text,
                description: descriptionController.text,
                isCompleted: todo.isCompleted,
              );

              print("🔄 Updating todo: ${updatedTodo.toJson()}");

              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}

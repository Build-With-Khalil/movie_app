import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/component/custom_icon.dart';
import '../../../../../core/params/todo_params.dart';
import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/services/storage/token_storage.dart';
import '../../../../../core/utils/enum/enums.dart';
import '../../../domain/entities/todo_entity.dart';
import '../../bloc/todo_bloc.dart';
import '../../widgets/todo_widget.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(FetchTodoListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: CustomIcon(
          icon: Iconsax.arrow_left3,
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
            TokenStorage.removeToken();
          },
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Todo List',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
              ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<TodoBloc, TodoState>(
        listenWhen: (previous, current) =>
            previous.postApiStatus != current.postApiStatus,
        listener: (context, state) {
          if (state.postApiStatus == PostAPIStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Todo updated successfully!")),
            );
          } else if (state.postApiStatus == PostAPIStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.errorMessage}")),
            );
          }
        },
        child: BlocBuilder<TodoBloc, TodoState>(
          buildWhen: (previous, current) =>
              previous.todoList != current.todoList,
          builder: (context, state) {
            final todoList = state.todoList;
            if (state.listLoader == true) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<TodoBloc>().add(FetchTodoListEvent());
                },
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return TodoWidget(
                      id: '${index + 1}',
                      onDeletePressed: () {
                        context.read<TodoBloc>().add(
                              DeleteTodoEvent(
                                todoList[index].id.toString(),
                              ),
                            );
                      },
                      onEditPressed: () {
                        editTodoDialog(
                          context,
                          todoList[index],
                        );
                      },
                      todo: todoList[index],
                    );
                  },
                  itemCount: state.todoList.length,
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => Navigator.pushNamed(
          context,
          RoutesName.addTodoView,
        ),
        child: Icon(
          Icons.add,
          color: Theme.of(context).canvasColor,
        ),
      ),
    );
  }

  void editTodoDialog(BuildContext context, TodoListEntity todo) {
    final titleController = TextEditingController(text: todo.title);
    final descriptionController = TextEditingController(text: todo.description);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Todo'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text.trim();
                final description = descriptionController.text.trim();

                if (title.isEmpty || description.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Both fields are required'),
                    ),
                  );
                  return;
                }

                final updatedTodo = TodoParams(
                  id: todo.id,
                  title: title,
                  description: description,
                  isCompleted: todo.isCompleted,
                );

                print("🔄 Updating todo: ${updatedTodo.toJson()}");

                // 🔁 Optional: Dispatch event using Bloc here
                context.read<TodoBloc>().add(UpdateTodoEvent(updatedTodo));

                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

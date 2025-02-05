import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app/src/core/component/custom_icon.dart';
import 'package:movie_app/src/core/utils/enum/enums.dart';

import '../../../../../core/routes/routes_name.dart';
import '../../bloc/todo_bloc.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        // BlocProvider.of<TodoBloc>(context).add(FetchTodosListEvent());
        context.read<TodoBloc>().add(FetchTodosListEvent());
      },
    );
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: CustomIcon(
          icon: Iconsax.arrow_left3,
          color: Colors.white,
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
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          switch (state.postAPIStatus) {
            case PostAPIStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case PostAPIStatus.error:
              return Center(
                child: Text(
                  state.message.toString(),
                  style: const TextStyle(color: Colors.red),
                ),
              );

            case PostAPIStatus.success:
              if (state.todoListModel.isEmpty) {
                return const Center(
                  child: Text("No Data Available"),
                );
              }
              final todoList = state.todoListModel;
              return ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  final todoItem = todoList[index];
                  return ListTile(
                    title: Text(todoItem.title.toString()),
                    subtitle: Text(todoItem.description.toString()),
                  );
                },
              );

            default:
              return const SizedBox.shrink();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => Navigator.pushNamed(context, RoutesName.addTodoView),
        child: Icon(
          Icons.add,
          color: Theme.of(context).canvasColor,
        ),
      ),
    );
  }
}

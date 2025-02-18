import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app/src/core/component/custom_icon.dart';
import 'package:movie_app/src/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:movie_app/src/features/todo/presentation/widgets/todo_widget.dart';

import '../../../../../core/routes/routes_name.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  void initState() {
    // TODO: implement initState
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
          if (state.listLoader) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {},
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return TodoWidget(
                    onDeletePressed: () {},
                    onEditPressed: () {},
                    todo: state.todoList![index],
                  );
                },
                itemCount: state.todoList?.length,
              ),
            );
          }
        },
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
}

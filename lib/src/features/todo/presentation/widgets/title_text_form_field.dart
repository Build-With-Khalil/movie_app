import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/features/todo/presentation/widgets/custom_text_field.dart';

import '../bloc/todo_bloc.dart';

class TitleTextFormField extends StatefulWidget {
  const TitleTextFormField({
    super.key,
  });

  @override
  State<TitleTextFormField> createState() => _TitleTextFormFieldState();
}

class _TitleTextFormFieldState extends State<TitleTextFormField> {
  late TextEditingController titleController;
  late FocusNode titleFocusNode;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    titleFocusNode = FocusNode();
  }

  @override
  void dispose() {
    titleController.dispose();
    titleFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      buildWhen: (previous, current) => previous.title != current.title,
      builder: (context, state) {
        return CustomTextField(
          controller: titleController,
          hintText: "Title",
          minLine: 1,
          maxLine: 1,
          focusNode: titleFocusNode,
          onChanged: (value) {
            context.read<TodoBloc>().add(
                  TitleTodoEvent(value),
                );
          },
        );
      },
    );
  }
}

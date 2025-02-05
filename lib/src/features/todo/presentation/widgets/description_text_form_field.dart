import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/features/todo/presentation/widgets/custom_text_field.dart';

import '../bloc/todo_bloc.dart';

class DescriptionTextFormField extends StatefulWidget {
  const DescriptionTextFormField({
    super.key,
  });

  @override
  State<DescriptionTextFormField> createState() =>
      _DescriptionTextFormFieldState();
}

class _DescriptionTextFormFieldState extends State<DescriptionTextFormField> {
  late TextEditingController descriptionController;
  late FocusNode descriptionFocusNode;

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController();
    descriptionFocusNode = FocusNode();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    descriptionFocusNode.dispose();
    descriptionController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      buildWhen: (previous, current) =>
          previous.description != current.description,
      builder: (context, state) {
        return CustomTextField(
          controller: descriptionController,
          hintText: "Description",
          focusNode: descriptionFocusNode,
          onChanged: (value) {
            context.read<TodoBloc>().add(
                  DescriptionTodoEvent(value),
                );
          },
        );
      },
    );
  }
}

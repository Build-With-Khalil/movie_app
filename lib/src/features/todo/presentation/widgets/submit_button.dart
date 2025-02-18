import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/component/round_button.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/theme/theme_instances.dart';

class SubmitButton extends StatelessWidget {
  final String? title;
  final String? description;

  const SubmitButton({super.key, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      title: Text(
        "Add",
        style: ThemeInstance(context).titleLarge!.apply(
              color: AppColors.white,
            ),
      ),
      onPressed: () {
        log("Title: ${title}");
        log("Description: ${description}");
        // context.read<TodoBloc>().add(AddTodoEvent(
        //     title: title ?? "", description: description ?? ""));
      },
    );
  }
}

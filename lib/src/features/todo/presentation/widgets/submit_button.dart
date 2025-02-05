import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/utils/constants/app_colors.dart';
import 'package:movie_app/src/core/utils/theme/theme_instances.dart';

import '../../../../core/component/round_button.dart';
import '../bloc/todo_bloc.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return RoundedButton(
          title: Text(
            "Add",
            style: ThemeInstance(context).titleLarge!.apply(
                  color: AppColors.white,
                ),
          ),
          onPressed: () {
            BlocProvider.of<TodoBloc>(context).add(SubmitingTodoEvent());
          },
        );
      },
    );
  }
}

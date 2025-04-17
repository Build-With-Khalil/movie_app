import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/component/round_button.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/theme/theme_instances.dart';
import '../../bloc/todo_bloc.dart';
import '../../widgets/custom_text_field.dart';

class AddTodoView extends StatefulWidget {
  const AddTodoView({super.key});

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Iconsax.arrow_left_1,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          onPressed: () {
            Navigator.pop(context);
            context.read<TodoBloc>().add(FetchTodoListEvent());
          },
        ),
        title: Text(
          'Add Todo',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 8.0,
          children: <Widget>[
            CustomTextField(
              controller: titleController,
              hintText: "Title",
              minLine: 1,
              maxLine: 1,
              onChanged: (value) {},
            ),
            CustomTextField(
              controller: descriptionController,
              hintText: "Description",
              onChanged: (value) {},
            ),
            RoundedButton(
              title: Text(
                "Add",
                style: ThemeInstance(context).titleLarge!.apply(
                      color: AppColors.white,
                    ),
              ),
              onPressed: () {
                context.read<TodoBloc>().add(
                      AddTodoEvent(
                        title: titleController.text ?? '',
                        description: descriptionController.text ?? '',
                      ),
                    );
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/description_text_form_field.dart';
import '../../widgets/submit_button.dart';
import '../../widgets/title_text_form_field.dart';

class AddTodoView extends StatelessWidget {
  const AddTodoView({super.key});

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
          onPressed: () => Navigator.pop(context),
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
            TitleTextFormField(),
            DescriptionTextFormField(),
            SubmitButton(),
          ],
        ),
      ),
    );
  }
}

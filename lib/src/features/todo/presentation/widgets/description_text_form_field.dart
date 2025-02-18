import 'package:flutter/material.dart';
import 'package:movie_app/src/features/todo/presentation/widgets/custom_text_field.dart';

class DescriptionTextFormField extends StatefulWidget {
  final TextEditingController controller;

  const DescriptionTextFormField({
    super.key,
    required this.controller,
  });

  @override
  State<DescriptionTextFormField> createState() =>
      _DescriptionTextFormFieldState();
}

class _DescriptionTextFormFieldState extends State<DescriptionTextFormField> {
  late FocusNode descriptionFocusNode;

  @override
  void initState() {
    super.initState();

    descriptionFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      hintText: "Description",
      focusNode: descriptionFocusNode,
      onChanged: (value) {},
    );
  }
}

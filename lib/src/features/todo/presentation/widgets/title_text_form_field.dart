import 'package:flutter/material.dart';
import 'package:movie_app/src/features/todo/presentation/widgets/custom_text_field.dart';

class TitleTextFormField extends StatefulWidget {
  final TextEditingController controller;

  const TitleTextFormField({
    super.key,
    required this.controller,
  });

  @override
  State<TitleTextFormField> createState() => _TitleTextFormFieldState();
}

class _TitleTextFormFieldState extends State<TitleTextFormField> {
  late FocusNode titleFocusNode;

  @override
  void initState() {
    super.initState();

    titleFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      hintText: "Title",
      minLine: 1,
      maxLine: 1,
      focusNode: titleFocusNode,
      onChanged: (value) {},
    );
  }
}

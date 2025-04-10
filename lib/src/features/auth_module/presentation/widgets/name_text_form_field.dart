import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/component/custom_icon.dart';
import '../../../../core/component/custom_text_form_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_string.dart';
import '../../../../core/utils/theme/theme_instances.dart';
import '../../../../core/utils/validation/validation.dart';

class NameTextFormField extends StatefulWidget {
  final TextEditingController nameController;

  const NameTextFormField({super.key, required this.nameController});

  @override
  _NameTextFormFieldState createState() => _NameTextFormFieldState();
}

class _NameTextFormFieldState extends State<NameTextFormField> {
  late FocusNode nameFocusNode;

  @override
  void initState() {
    super.initState();
    nameFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.nameController,
      hintText: AppStrings.name,
      hintStyle: ThemeInstance(context).titleMedium!.apply(
            color: AppColors.grey,
          ),
      prefixIcon: const CustomIcon(
        icon: Iconsax.user,
      ),
      focusNode: nameFocusNode,
      onChanged: (value) {},
      onFieldSubmitted: (value) {},
      keyboardType: TextInputType.name,
      validator: (value) => AppValidators.emptyFieldValidate(
        '$value',
      ),
      txtColor: AppColors.black,
      borderColor: AppColors.grey,
      focusedBorderColor: AppColors.primary,
    );
  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    super.dispose();
  }
}

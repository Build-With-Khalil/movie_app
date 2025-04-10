import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/component/custom_icon.dart';
import '../../../../core/component/custom_text_form_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_string.dart';
import '../../../../core/utils/theme/theme_instances.dart';
import '../../../../core/utils/validation/validation.dart';

class SurNameTextFormField extends StatefulWidget {
  final TextEditingController surNameController;

  const SurNameTextFormField({super.key, required this.surNameController});

  @override
  _SurNameTextFormFieldState createState() => _SurNameTextFormFieldState();
}

class _SurNameTextFormFieldState extends State<SurNameTextFormField> {
  late FocusNode surNameFocusNode;

  @override
  void initState() {
    super.initState();
    surNameFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.surNameController,
      hintText: AppStrings.name,
      hintStyle: ThemeInstance(context).titleMedium!.apply(
            color: AppColors.grey,
          ),
      prefixIcon: const CustomIcon(
        icon: Iconsax.user,
      ),
      focusNode: surNameFocusNode,
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
    surNameFocusNode.dispose();
    super.dispose();
  }
}

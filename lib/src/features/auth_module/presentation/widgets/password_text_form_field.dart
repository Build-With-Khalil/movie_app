import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/component/custom_icon.dart';
import '../../../../core/component/custom_text_form_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_string.dart';
import '../../../../core/utils/theme/theme_instances.dart';
import '../../../../core/utils/validation/validation.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController passwordController;
  const PasswordTextFormField({super.key, required this.passwordController});

  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  late FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();
    passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.passwordController,
      hintText: AppStrings.password,
      hintStyle: ThemeInstance(context).titleMedium!.apply(
            color: AppColors.grey,
          ),
      onChanged: (value) {},
      onFieldSubmitted: (value) {},
      prefixIcon: const CustomIcon(
        icon: Iconsax.lock,
      ),
      suffixIcon: CustomIcon(
        icon: Iconsax.eye,
        onPressed: () {},
      ),
      keyboardType: TextInputType.visiblePassword,
      focusNode: passwordFocusNode,
      validator: (value) => AppValidators.validatePassword(value),
      txtColor: AppColors.black,
      borderColor: AppColors.grey,
      focusedBorderColor: AppColors.primary,
    );
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    super.dispose();
  }
}

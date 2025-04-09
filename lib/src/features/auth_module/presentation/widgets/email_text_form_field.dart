import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/component/custom_icon.dart';
import '../../../../core/component/custom_text_form_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_string.dart';
import '../../../../core/utils/theme/theme_instances.dart';
import '../../../../core/utils/validation/validation.dart';

class EmailTextFormField extends StatefulWidget {
  final TextEditingController emailController;

  const EmailTextFormField({super.key, required this.emailController});

  @override
  _EmailTextFormFieldState createState() => _EmailTextFormFieldState();
}

class _EmailTextFormFieldState extends State<EmailTextFormField> {
  late FocusNode emailFocusNode;

  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.emailController,
      hintText: AppStrings.email,
      hintStyle: ThemeInstance(context).titleMedium!.apply(
            color: AppColors.grey,
          ),
      prefixIcon: const CustomIcon(
        icon: Iconsax.sms,
      ),
      focusNode: emailFocusNode,
      onChanged: (value) {},
      onFieldSubmitted: (value) {},
      keyboardType: TextInputType.emailAddress,
      validator: (value) => AppValidators.validateEmail(value),
      txtColor: AppColors.black,
      borderColor: AppColors.grey,
      focusedBorderColor: AppColors.primary,
    );
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../config/component/custom_icon.dart';
import '../../../../../../config/component/custom_text_form_field.dart';
import '../../../../../../config/constants/app_colors.dart';
import '../../../../../../config/constants/app_string.dart';
import '../../../../../../config/theme/theme_instances.dart';
import '../../../../../../config/validation/validation.dart';
import '../bloc/login_bloc.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final emailFocusNode = FocusNode();
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return CustomTextField(
          controller: emailController,
          hintText: AppStrings.email,
          hintStyle: ThemeInstance(context).titleMedium!.apply(
                color: AppColors.grey,
              ),
          prefixIcon: const CustomIcon(
            icon: Iconsax.sms,
          ),
          focusNode: emailFocusNode,
          onChanged: (value) {
            context.read<LoginBloc>().add(
                  EmailChanged(email: value),
                );
          },
          onFieldSubmitted: (value) {},
          keyboardType: TextInputType.emailAddress,
          validator: (value) => AppValidators.validateEmail(value),
          txtColor: AppColors.black,
          borderColor: AppColors.grey,
          focusedBorderColor: AppColors.primary,
        );
      },
    );
  }
}

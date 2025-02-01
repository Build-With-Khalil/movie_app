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

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final passwordFocusNode = FocusNode();

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CustomTextField(
          controller: passwordController,
          hintText: AppStrings.password,
          hintStyle: ThemeInstance(context).titleMedium!.apply(
                color: AppColors.grey,
              ),
          onChanged: (value) {
            context.read<LoginBloc>().add(
                  PasswordChanged(password: value),
                );
          },
          onFieldSubmitted: (value) {},
          prefixIcon: const CustomIcon(
            icon: Iconsax.lock,
          ),
          suffixIcon: CustomIcon(
            icon: Iconsax.eye,
          ),
          keyboardType: TextInputType.visiblePassword,
          focusNode: passwordFocusNode,
          validator: (value) => AppValidators.validatePassword(value),
          txtColor: AppColors.black,
          borderColor: AppColors.grey,
          focusedBorderColor: AppColors.primary,
        );
      },
    );
  }
}

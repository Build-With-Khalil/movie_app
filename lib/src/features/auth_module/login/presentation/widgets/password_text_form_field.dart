import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/component/custom_icon.dart';
import '../../../../../core/component/custom_text_form_field.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_string.dart';
import '../../../../../core/utils/theme/theme_instances.dart';
import '../../../../../core/utils/validation/validation.dart';
import '../bloc/login_bloc.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({super.key});

  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  late TextEditingController passwordController;
  late FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.isObscure != current.isObscure,
      builder: (context, state) {
        return CustomTextFormField(
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
          isObSecure: state.isObscure,
          prefixIcon: const CustomIcon(
            icon: Iconsax.lock,
          ),
          suffixIcon: CustomIcon(
            icon: state.isObscure ? Iconsax.eye_slash : Iconsax.eye,
            onPressed: () {
              context.read<LoginBloc>().add(VisibleEye());
            },
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

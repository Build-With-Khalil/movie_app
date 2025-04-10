import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/features/auth_module/presentation/widgets/email_text_form_field.dart';
import 'package:movie_app/src/features/auth_module/presentation/widgets/form_button.dart';
import 'package:movie_app/src/features/auth_module/presentation/widgets/form_section.dart';
import 'package:movie_app/src/features/auth_module/presentation/widgets/password_text_form_field.dart';

import '../../../../core/utils/constants/app_string.dart';
import '../../../../core/utils/enum/enums.dart';
import '../../../../core/utils/theme/theme_instances.dart';
import '../bloc/auth_bloc.dart';

class FormWidget extends StatefulWidget {
  final double height;
  final double width;
  final PostAPIStatus status;

  const FormWidget({
    super.key,
    required this.height,
    required this.width,
    required this.status,
  });

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Email CustomTextField
          EmailTextFormField(
            emailController: emailController,
          ),
          SizedBox(height: widget.height * 0.02),

          /// Password CustomTextField
          PasswordTextFormField(
            passwordController: passwordController,
          ),
          SizedBox(height: widget.height * 0.02),

          /// Forgot Password
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              AppStrings.forgotPassword,
              style: ThemeInstance(context).titleLarge,
            ),
          ),
          SizedBox(height: widget.height * 0.02),

          /// Sign In Button
          FormButton(
            width: widget.width,
            height: widget.width,
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                BlocProvider.of<AuthBloc>(context).add(
                  LoginRequested(
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                );
              }
            },
            isLoading: widget.status == PostAPIStatus.loading,
            text: AppStrings.signIn, // Pass the loading status
          ),
          SizedBox(height: widget.height * 0.02),

          /// Sign Up Section
          FormSection(
            height: widget.height,
            text1: AppStrings.doNotHaveAnAcc,
            text2: AppStrings.signUp,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/src/features/auth_module/login/presentation/widgets/email_text_form_field.dart';
import 'package:movie_app/src/features/auth_module/login/presentation/widgets/login_button.dart';
import 'package:movie_app/src/features/auth_module/login/presentation/widgets/password_text_form_field.dart';
import 'package:movie_app/src/features/auth_module/login/presentation/widgets/sign_up_section.dart';

import '../../../../../core/utils/constants/app_string.dart';
import '../../../../../core/utils/theme/theme_instances.dart';

class FormWidget extends StatelessWidget {
  final double height;
  final double width;

  const FormWidget({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    /// Create the formKey locally in the LoginView
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Email CustomTextField
          EmailTextFormField(),
          SizedBox(height: height * 0.02),

          /// Password CustomTextField
          PasswordTextFormField(),
          SizedBox(height: height * 0.02),

          /// Forgot Password
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              AppStrings.forgotPassword,
              style: ThemeInstance(context).titleLarge,
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Sign In Button
          LogInButton(
            height: height,
            width: width,
            formKey: formKey,
          ),
          SizedBox(height: height * 0.02),

          /// Sign Up Section
          SignUpSection(height: height),
        ],
      ),
    );
  }
}

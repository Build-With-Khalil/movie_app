import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/features/auth_module/login/presentation/widgets/email_text_form_field.dart';
import 'package:movie_app/src/features/auth_module/login/presentation/widgets/login_button.dart';
import 'package:movie_app/src/features/auth_module/login/presentation/widgets/password_text_form_field.dart';
import 'package:movie_app/src/features/auth_module/login/presentation/widgets/sign_up_section.dart';

import '../../../../../../config/constants/app_string.dart';
import '../../../../../../config/theme/theme_instances.dart';
import '../bloc/login_bloc.dart';

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
    /// Focus Nodes
    final emailFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();

    /// Create the formKey locally in the LoginView
    final formKey = GlobalKey<FormState>();

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
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
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/component/round_button.dart';
import '../../../../../core/utils/constants/app_string.dart';
import '../bloc/login_bloc.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({
    required this.height,
    required this.width,
    super.key,
    required this.formKey,
  });

  final double height, width;
  final formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => false,
      builder: (context, state) {
        return RoundedButton(
          height: height * 0.07,
          width: width * 0.8,
          title: AppStrings.signInC,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              // Handle login logic here
            }
          },
        );
      },
    );
  }
}

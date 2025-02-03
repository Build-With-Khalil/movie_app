import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/utils/constants/app_colors.dart';
import 'package:movie_app/src/core/utils/theme/theme_instances.dart';

import '../../../../../core/component/flush_bar.dart';
import '../../../../../core/component/round_button.dart';
import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/utils/constants/app_string.dart';
import '../../../../../core/utils/enum/enums.dart';
import '../bloc/login_bloc.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({
    required this.height,
    required this.width,
    super.key,
    required this.formKey,
  });

  final double height, width;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.postApiStatus != current.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostAPIStatus.success) {
          FlushBarSuccessMessage(context).flushBarSuccessMessage(
            message: state.message.toString(),
          );
          Navigator.pushNamed(context, RoutesName.home);
        }
        if (state.postApiStatus == PostAPIStatus.error) {
          FlushBarErrorMessage(context).flushBarErrorMessage(
            message: state.message.toString(),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) =>
            previous.postApiStatus != current.postApiStatus,
        builder: (context, state) {
          return RoundedButton(
            height: height * 0.07,
            width: width * 0.8,
            title: state.postApiStatus == PostAPIStatus.loading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.whiteColor,
                    ),
                  )
                : Text(
                    AppStrings.signIn,
                    style: ThemeInstance(context).displaySmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(LoginApiCall());
              }
            },
          );
        },
      ),
    );
  }
}

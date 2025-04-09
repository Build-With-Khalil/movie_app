import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_string.dart';
import '../../../../core/utils/enum/enums.dart';
import '../../../../core/utils/theme/theme_instances.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// Get the height and width of the screen
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Stack(
        children: [
          /// Background Gradient
          Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.secondary,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: height * 0.1,
                left: width * 0.05,
              ),
              child: Text(
                AppStrings.helloSignIn,
                style: ThemeInstance(context).headlineLarge!.apply(
                      color: AppColors.whiteColor,
                    ),
              ),
            ),
          ),

          /// Login Form
          Positioned(
            top: height * 0.25,
            child: Container(
              height: height * 0.75,
              width: width,
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.05,
                ),
                child: BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      // Handle success (e.g., navigate to the next screen)
                    } else if (state is AuthError) {
                      // Handle error
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                    }
                  },
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      PostAPIStatus status = PostAPIStatus.initial;
                      if (state is AuthLoading) {
                        status = state.postApiStatus;
                      } else if (state is AuthSuccess) {
                        status = state.postApiStatus;
                      } else if (state is AuthError) {
                        status = state.postApiStatus;
                      }
                      return FormWidget(
                        height: height,
                        width: width,
                        status: status,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

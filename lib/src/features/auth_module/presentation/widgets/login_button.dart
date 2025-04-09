import 'package:flutter/material.dart';
import 'package:movie_app/src/core/utils/theme/theme_instances.dart';

import '../../../../core/component/round_button.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({
    super.key,
    required this.height,
    required this.width,
    required this.onPressed,
    required this.isLoading,
  });

  final double height, width;
  final void Function() onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      height: height * 0.15,
      width: width * 0.8,
      title: isLoading
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ) // Show loader when loading
          : Text(
              'Login',
              style: ThemeInstance(context).headlineSmall!.apply(
                    color: Colors.white,
                  ),
            ),
      onPressed: onPressed,
    );
  }
}

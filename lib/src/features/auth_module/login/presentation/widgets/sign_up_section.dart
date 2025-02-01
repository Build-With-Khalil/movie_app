import 'package:flutter/material.dart';

import '../../../../../../config/constants/app_colors.dart';
import '../../../../../../config/constants/app_string.dart';
import '../../../../../../config/theme/theme_instances.dart';

class SignUpSection extends StatelessWidget {
  const SignUpSection({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          Text(
            AppStrings.doNotHaveAnAcc,
            style: ThemeInstance(context).labelLarge,
          ),
          SizedBox(height: height * 0.01),
          Text(
            AppStrings.signUp,
            style: ThemeInstance(context).headlineSmall!.apply(
                  color: AppColors.secondary,
                ),
          ),
        ],
      ),
    );
  }
}

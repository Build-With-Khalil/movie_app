import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/theme/theme_instances.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    super.key,
    required this.height,
    required this.text1,
    required this.text2,
  });

  final String text1, text2;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          Text(
            text1,
            style: ThemeInstance(context).labelLarge,
          ),
          SizedBox(height: height * 0.01),
          Text(
            text2,
            style: ThemeInstance(context).headlineSmall!.apply(
                  color: AppColors.secondary,
                ),
          ),
        ],
      ),
    );
  }
}

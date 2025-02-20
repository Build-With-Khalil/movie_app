import 'package:flutter/material.dart';

import '../utils/constants/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double height, width;
  final Widget title;
  const RoundedButton({
    super.key,
    required this.onPressed,
    this.height = 50,
    required this.title,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.secondary,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: title,
        ),
      ),
    );
  }
}

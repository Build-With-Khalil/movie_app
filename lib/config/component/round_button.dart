import 'package:flutter/material.dart';

import '../color/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double height;
  final String title;

  const RoundedButton({
    super.key,
    required this.onPressed,
    this.height = 50,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}

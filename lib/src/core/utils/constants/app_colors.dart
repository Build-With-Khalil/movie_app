import 'package:flutter/material.dart';

class AppColors {
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const Color secondary = Color(0xff16213E);
  static const Color accent = Color(0xffB81736);
  static const Color primary = Color(0xff2D8E84);
  static const Color secondaryColor = Color(0xff383838);
  static const Color whiteColor = Colors.white;
  static const errorColor = Colors.red;
  static const Color grey = Colors.grey;
  static const LinearGradient linearGradient = LinearGradient(
    colors: [
      AppColors.primary,
      AppColors.secondary,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

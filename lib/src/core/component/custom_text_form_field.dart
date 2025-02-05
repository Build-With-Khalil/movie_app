import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isObSecure;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Color txtColor;
  final Color? borderColor;
  final Color focusedBorderColor;
  final FocusNode? focusNode;
  final Function(PointerDownEvent)? onTapOutside;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.isObSecure = false,
    required this.validator,
    required this.keyboardType,
    required this.txtColor,
    required this.borderColor,
    required this.focusedBorderColor,
    this.onTapOutside,
    this.focusNode,
    this.onChanged,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObSecure,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      style: TextStyle(color: txtColor),
      onTapOutside: onTapOutside,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: focusedBorderColor),
        ),
      ),
      validator: validator,
    );
  }
}

import 'package:flutter/material.dart';

class BaseTextFieldWidget extends StatelessWidget {
  const BaseTextFieldWidget(
      {super.key,
      required this.controller,
      this.hintText,
      this.helperText,
      this.validator,
      this.keyboardType,
      this.suffixIcon,
      this.icon,
      this.onChanged,
      this.obscureText});
  final String? hintText;
  final String? helperText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? icon;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: icon,
        suffixIcon: suffixIcon,
        labelText: helperText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

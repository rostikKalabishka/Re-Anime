import 'package:flutter/material.dart';

class BaseTextFieldWidget extends StatelessWidget {
  const BaseTextFieldWidget(
      {super.key, required this.controller, this.hintText});
  final String? hintText;

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
          disabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
    );
  }
}

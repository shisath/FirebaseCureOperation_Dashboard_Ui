import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int length;

  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: length,
      decoration: InputDecoration(labelText: labelText),
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}

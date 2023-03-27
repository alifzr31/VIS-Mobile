import 'package:flutter/material.dart';

class BaseTextInput extends StatelessWidget {
  const BaseTextInput({
    Key? key,
    required this.labelText,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  final String labelText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Icon? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        suffixIcon: suffixIcon,
        suffixIconColor: Colors.black,
        prefixIcon: prefixIcon,
        prefixIconColor: Colors.black,
        contentPadding: const EdgeInsets.all(18),
        fillColor: Colors.grey.withOpacity(0.5),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
        errorStyle: TextStyle(
          color: Colors.red.shade800,
          fontSize: 14,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.red.shade800,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.red.shade800,
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    );
  }
}

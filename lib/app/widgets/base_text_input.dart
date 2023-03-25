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
        labelStyle: const TextStyle(color: Colors.white),
        suffixIcon: suffixIcon,
        suffixIconColor: Colors.white,
        prefixIcon: prefixIcon,
        prefixIconColor: Colors.white,
        contentPadding: const EdgeInsets.all(18),
        fillColor: Colors.blueGrey.withOpacity(0.5),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        errorStyle: const TextStyle(
          color: Colors.amber,
          fontSize: 14,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.amber,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.amber,
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    );
  }
}

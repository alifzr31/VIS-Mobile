import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class BaseDateTimePicker extends StatelessWidget {
  const BaseDateTimePicker({
    Key? key,
    required this.type,
    required this.label,
    this.controller,
    this.validator,
    this.prefixIcon,
  }) : super(key: key);

  final DateTimePickerType type;
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      controller: controller,
      type: type,
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
      onChanged: (val) => print(val),
      validator: validator,
      onSaved: (val) => (val),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: label,
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
          fontSize: 12,
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
        fontSize: 12,
      ),
    );
  }
}

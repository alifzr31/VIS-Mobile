import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  final void Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 15),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        shape: StadiumBorder(),
        elevation: 3,
      ),
    );
  }
}

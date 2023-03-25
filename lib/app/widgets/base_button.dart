import 'package:flutter/material.dart';
import 'package:vis_mobile/app/core/value/colors.dart';

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
        style: const TextStyle(
          color: blueColor,
          fontSize: 15,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: StadiumBorder(),
        elevation: 3,
      ),
    );
  }
}

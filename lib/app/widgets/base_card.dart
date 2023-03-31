import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    Key? key,
    this.onTap,
    this.child,
    this.splashColor,
  }) : super(key: key);

  final void Function()? onTap;
  final Widget? child;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.grey.shade400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: InkWell(
        onTap: onTap,
        splashColor: splashColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: child,
        ),
      ),
    );
  }
}

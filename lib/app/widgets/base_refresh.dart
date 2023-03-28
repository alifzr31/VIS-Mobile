import 'package:flutter/material.dart';

class BaseRefresh extends StatelessWidget {
  const BaseRefresh({
    Key? key,
    required this.onRefresh,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Colors.black,
      color: Colors.white,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
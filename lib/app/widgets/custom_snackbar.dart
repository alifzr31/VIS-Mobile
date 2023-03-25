import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static dynamic success = Get.snackbar('Success', 'message');
  static dynamic failed = Get.snackbar(
    'Failed',
    'message',
    colorText: Colors.white,
    backgroundColor: Colors.red.withOpacity(0.8),
  );
}

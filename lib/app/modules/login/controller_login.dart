import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/providers/login_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final LoginProvider loginProvider;

  LoginController({required this.loginProvider});

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    var data = ({
      'username': usernameController.text.trim(),
      'password': passwordController.text.trim(),
    });

    try {
      final response = await loginProvider.login(data);
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        await _prefs.setString('access', body['access']);
        await _prefs.setString('refresh', body['refresh']);
        Get.snackbar(
          'Success',
          'Login Success',
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
          icon: const Icon(Icons.check, color: Colors.white),
        );
        Get.offAndToNamed('/dashboard');
      } else {
        Get.snackbar(
          'Login Failed',
          'Email or Password is wrong',
          backgroundColor: Colors.amber.withOpacity(0.8),
          colorText: blueColor,
          icon: const Icon(
            Icons.person_off,
            color: blueColor,
            size: 30,
          ),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Failed',
        e.toString(),
        backgroundColor: Colors.amber.withOpacity(0.8),
        colorText: blueColor,
        icon: const Icon(Icons.mobiledata_off, color: blueColor),
      );
    }
  }
}

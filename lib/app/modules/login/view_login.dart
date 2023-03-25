import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/modules/login/controller_login.dart';
import 'package:vis_mobile/app/widgets/base_button.dart';
import 'package:vis_mobile/app/widgets/base_text_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.find<LoginController>();
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Image.asset('assets/login.png'),
                    const SizedBox(height: 20),
                    const Text(
                      'Vendor Information System',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 50),
                    BaseTextInput(
                      labelText: 'Username',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.person),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill email field';
                        }

                        return null;
                      },
                      controller: controller.usernameController,
                    ),
                    const SizedBox(height: 20),
                    BaseTextInput(
                      labelText: 'Password',
                      controller: controller.passwordController,
                      obscureText: showPassword,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        child: Icon(
                          showPassword
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill password field';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: Get.height * 0.10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: Get.width * 0.25),
                        Container(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (controller.formKey.currentState!.validate()) {
                                controller.login();
                              }
                            },
                            child: const Icon(
                              Icons.keyboard_arrow_right,
                              size: 50,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: CircleBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

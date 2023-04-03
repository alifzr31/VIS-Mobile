import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/modules/login/controller_login.dart';
import 'package:vis_mobile/app/widgets/base_text_input.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg-login.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 0,
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.grey.withOpacity(0.1),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Image.asset('assets/login_.png'),
                      const SizedBox(height: 20),
                      const Text(
                        'Vendor Information System',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
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
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: Icon(
                            showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
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
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: Get.width * 0.25),
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  await EasyLoading.show(
                                    status: 'Loading',
                                    maskType: EasyLoadingMaskType.black,
                                  );
                                  controller.login();
                                  await EasyLoading.dismiss();
                                }
                              },
                              child: const Icon(
                                Icons.keyboard_arrow_right,
                                size: 50,
                                color: Colors.white,
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                overlayColor: MaterialStateProperty.all(
                                    Colors.grey.withOpacity(0.3)),
                                shape:
                                    MaterialStateProperty.all(CircleBorder()),
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
      ],
    );
  }
}

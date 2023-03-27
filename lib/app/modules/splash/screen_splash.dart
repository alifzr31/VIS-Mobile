import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/core/value/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(milliseconds: 4600),
      () async {
        navigate();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg-login.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/splash_.png'),
                    const SizedBox(height: 20),
                    Text(
                      'PT Anyar Retail Indonesia',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 3,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 50),
                    SimpleCircularProgressBar(
                      mergeMode: true,
                      onGetText: (double value) {
                        return Text(
                          '${value.toInt()}%',
                          style: const TextStyle(color: Colors.black),
                        );
                      },
                      progressStrokeWidth: 6,
                      backStrokeWidth: 6,
                      backColor: Colors.grey.withOpacity(0.3),
                      animationDuration: 4,
                      progressColors: [
                        Colors.grey,
                        Colors.grey.shade800,
                      ],
                      size: 60,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 30,
                  right: 30,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: const [
                        Text(
                          'Powered By',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          'DEV-IT AnyarGroup | 2022',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

void navigate() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  var access = _prefs.getString('access');
  var refresh = _prefs.getString('refresh');

  if (access == null && refresh == null) {
    Get.offAllNamed('/login');
  } else {
    Get.offAllNamed('/dashboard');
  }
}

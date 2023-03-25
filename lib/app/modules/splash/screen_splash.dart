import 'dart:async';

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
      const Duration(milliseconds: 5500),
      () {
        Get.offAllNamed('/dashboard');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/splash.png'),
                const SizedBox(height: 20),
                Text(
                  'PT Anyar Retail Indonesia',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 3,
                      fontSize: 20,
                      color: Colors.white),
                ),
                const SizedBox(height: 50),
                SimpleCircularProgressBar(
                  mergeMode: true,
                  onGetText: (double value) {
                    return Text('${value.toInt()}%');
                  },
                  progressStrokeWidth: 6,
                  backStrokeWidth: 6,
                  backColor: Colors.blueAccent.shade100.withOpacity(0.3),
                  animationDuration: 5,
                  progressColors: [
                    Colors.white,
                    Colors.blueAccent.shade100,
                    Colors.blueAccent
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
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      'DEV-IT AnyarGroup | 2022',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// void navigate() async {
//   Get.offAllNamed('/dashboard');
// }
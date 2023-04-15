import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/routes/pages.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:vis_mobile/app/core/utils/my_http_overrides.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
    ),
  );
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ripple
    ..indicatorSize = 60;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //   ),
    // );

    return GetMaterialApp(
      title: 'VIS Mobile',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.grey,
        fontFamily: 'Verdana',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        fontFamily: 'Verdana',
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: AppPages.pages,
      builder: EasyLoading.init(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/routes/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'VIS Mobile',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.grey,
        fontFamily: 'Meta',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        fontFamily: 'Meta',
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: AppPages.pages,
    );
  }
}
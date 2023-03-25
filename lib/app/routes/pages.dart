import 'package:get/get.dart';
import 'package:vis_mobile/app/modules/login/binding_login.dart';
import 'package:vis_mobile/app/modules/login/view_login.dart';
import 'package:vis_mobile/app/modules/splash/screen_splash.dart';
import 'package:vis_mobile/app/routes/routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      binding: LoginBinding(),
      page: () => LoginPage(),
      transition: Transition.cupertinoDialog,
    ),
  ];
}

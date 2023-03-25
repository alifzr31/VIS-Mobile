import 'package:get/get.dart';
import 'package:vis_mobile/app/data/providers/login_provider.dart';
import 'package:vis_mobile/app/modules/login/controller_login.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginProvider>(() => LoginProvider());
    Get.lazyPut<LoginController>(() => LoginController(loginProvider: Get.find()));
  }
}
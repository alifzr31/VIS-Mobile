import 'package:get/get.dart';
import 'package:vis_mobile/app/data/providers/user_provider.dart';
import 'package:vis_mobile/app/modules/dashboard/controllers/user_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProvider>(() => UserProvider());
    Get.lazyPut<UserController>(() => UserController(userProvider: Get.find()));
  }
}
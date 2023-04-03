import 'package:get/get.dart';
import 'package:vis_mobile/app/data/providers/global_provider.dart';
import 'package:vis_mobile/app/modules/global/global_controller.dart';

class ApInvBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalProvider>(() => GlobalProvider());
    Get.lazyPut<GlobalController>(() => GlobalController(globalProvider: Get.find()));
  }
}
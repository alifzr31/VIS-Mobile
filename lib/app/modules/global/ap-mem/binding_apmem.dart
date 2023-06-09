import 'package:get/get.dart';
import 'package:vis_mobile/app/data/providers/detail_apmem.dart';
import 'package:vis_mobile/app/data/providers/global_provider.dart';
import 'package:vis_mobile/app/modules/global/ap-mem/details/controller_detail_apmem.dart';
import 'package:vis_mobile/app/modules/global/global_controller.dart';

class ApMemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalProvider>(() => GlobalProvider());
    Get.lazyPut<GlobalController>(() => GlobalController(globalProvider: Get.find()));

    Get.lazyPut<DetailApMemProvider>(() => DetailApMemProvider());
    Get.lazyPut<DetailApMemController>(() => DetailApMemController(detailApMemProvider: Get.find()));
  }
}
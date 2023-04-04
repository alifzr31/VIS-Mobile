import 'package:get/get.dart';
import 'package:vis_mobile/app/data/providers/detail_apmem.dart';
import 'package:vis_mobile/app/modules/global/ap-mem/details/controller_detail_apmem.dart';

class DetailApMemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailApMemProvider>(() => DetailApMemProvider());
    Get.lazyPut<DetailApMemController>(() => DetailApMemController(detailApMemProvider: Get.find()));
  }
}
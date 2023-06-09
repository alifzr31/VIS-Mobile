import 'package:get/get.dart';
import 'package:vis_mobile/app/data/providers/detail_apinv_provider.dart';
import 'package:vis_mobile/app/data/providers/global_provider.dart';
import 'package:vis_mobile/app/modules/global/ap-inv/details/controller_detail_apinv.dart';
import 'package:vis_mobile/app/modules/global/global_controller.dart';

class ApInvBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalProvider>(() => GlobalProvider());
    Get.lazyPut<GlobalController>(() => GlobalController(globalProvider: Get.find()));

    Get.lazyPut<DetailApInvProvider>(() => DetailApInvProvider());
    Get.lazyPut<DetailApInvController>(() => DetailApInvController(detailApInvProvider: Get.find()));
  }
}
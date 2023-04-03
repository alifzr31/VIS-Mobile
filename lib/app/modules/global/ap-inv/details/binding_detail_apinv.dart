import 'package:get/get.dart';
import 'package:vis_mobile/app/data/providers/detail_apinv_provider.dart';
import 'package:vis_mobile/app/modules/global/ap-inv/details/controller_detail_apinv.dart';

class DetailApInvBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailApInvProvider>(() => DetailApInvProvider());
    Get.lazyPut<DetailApInvController>(() => DetailApInvController(detailApInvProvider: Get.find()));
  }
}
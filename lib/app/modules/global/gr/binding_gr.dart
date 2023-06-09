import 'package:get/get.dart';
import 'package:vis_mobile/app/data/providers/detail_gr_provider.dart';
import 'package:vis_mobile/app/data/providers/global_provider.dart';
import 'package:vis_mobile/app/modules/global/global_controller.dart';
import 'package:vis_mobile/app/modules/global/gr/details/controller_detail_gr.dart';

class GrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalProvider>(() => GlobalProvider());
    Get.lazyPut<GlobalController>(() => GlobalController(globalProvider: Get.find()));

    Get.lazyPut<DetailGrProvider>(() => DetailGrProvider());
    Get.lazyPut<DetailGrController>(() => DetailGrController(detailGrProvider: Get.find()));
  }
}
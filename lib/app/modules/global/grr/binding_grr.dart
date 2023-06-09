import 'package:get/get.dart';
import 'package:vis_mobile/app/data/providers/detail_grr_provider.dart';
import 'package:vis_mobile/app/data/providers/global_provider.dart';
import 'package:vis_mobile/app/modules/global/global_controller.dart';
import 'package:vis_mobile/app/modules/global/grr/details/controller_detail_grr.dart';

class GrrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalProvider>(() => GlobalProvider());
    Get.lazyPut<GlobalController>(() => GlobalController(globalProvider: Get.find()));

    Get.lazyPut<DetailGrrProvider>(() => DetailGrrProvider());
    Get.lazyPut<DetailGrrController>(() => DetailGrrController(detailGrrProvider: Get.find()));
  }
}
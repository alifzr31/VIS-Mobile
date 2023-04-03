import 'package:get/get.dart';
import 'package:vis_mobile/app/data/providers/detail_grr_provider.dart';
import 'package:vis_mobile/app/modules/global/grr/details/controller_detail_grr.dart';

class DetailGrrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailGrrProvider>(() => DetailGrrProvider());
    Get.lazyPut<DetailGrrController>(() => DetailGrrController(detailGrrProvider: Get.find()));
  }
}
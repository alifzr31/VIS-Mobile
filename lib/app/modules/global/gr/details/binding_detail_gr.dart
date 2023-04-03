import 'package:get/get.dart';
import 'package:vis_mobile/app/data/providers/detail_gr_provider.dart';
import 'package:vis_mobile/app/modules/global/gr/details/controller_detail_gr.dart';

class DetailGrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailGrProvider>(() => DetailGrProvider());
    Get.lazyPut<DetailGrController>(() => DetailGrController(detailGrProvider: Get.find()));
  }
}
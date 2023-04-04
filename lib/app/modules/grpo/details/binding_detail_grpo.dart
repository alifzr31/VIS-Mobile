import 'package:get/get.dart';
import 'package:vis_mobile/app/data/providers/detail_grpo_provider.dart';
import 'package:vis_mobile/app/modules/grpo/details/controller_detail_grpo.dart';

class DetailGrpoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailGrpoProvider>(() => DetailGrpoProvider());
    Get.lazyPut<DetailGrpoController>(() => DetailGrpoController(detailGrpoProvider: Get.find()));
  }
}
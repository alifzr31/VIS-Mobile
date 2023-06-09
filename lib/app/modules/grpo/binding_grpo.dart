import 'package:get/get.dart';
import 'package:vis_mobile/app/data/providers/detail_grpo_provider.dart';
import 'package:vis_mobile/app/data/providers/grpo_provider.dart';
import 'package:vis_mobile/app/modules/grpo/controller_grpo.dart';
import 'package:vis_mobile/app/modules/grpo/details/controller_detail_grpo.dart';

class GrpoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GrpoProvider>(() => GrpoProvider());
    Get.lazyPut<GrpoController>(() => GrpoController(grpoProvider: Get.find()));

    Get.lazyPut<DetailGrpoProvider>(() => DetailGrpoProvider());
    Get.lazyPut<DetailGrpoController>(() => DetailGrpoController(detailGrpoProvider: Get.find()));
  }
}
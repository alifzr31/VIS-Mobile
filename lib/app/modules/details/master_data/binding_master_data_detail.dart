import 'package:get/get.dart';
import 'package:vis_mobile/app/data/providers/master_provider.dart';
import 'package:vis_mobile/app/modules/details/master_data/controller_master_data_detail.dart';

class MasterDataDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MasterProvider>(() => MasterProvider());
    Get.lazyPut<MasterDataDetailController>(() => MasterDataDetailController(masterProvider: Get.find()));
  }
}
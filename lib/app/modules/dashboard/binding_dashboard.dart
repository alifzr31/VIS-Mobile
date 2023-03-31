import 'package:get/get.dart';
import 'package:vis_mobile/app/data/providers/master_provider.dart';
import 'package:vis_mobile/app/data/providers/user_provider.dart';
import 'package:vis_mobile/app/modules/dashboard/controllers/masterdata_controller.dart';
import 'package:vis_mobile/app/modules/dashboard/controllers/user_controller.dart';
import 'package:vis_mobile/app/modules/details/master_data/controller_master_data_detail.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProvider>(() => UserProvider());
    Get.lazyPut<UserController>(() => UserController(userProvider: Get.find()));

    Get.lazyPut<MasterProvider>(() => MasterProvider());
    Get.lazyPut<MasterDataController>(() => MasterDataController(masterProvider: Get.find()));
    Get.lazyPut<MasterDataDetailController>(() => MasterDataDetailController(masterProvider: Get.find()));
  }
}
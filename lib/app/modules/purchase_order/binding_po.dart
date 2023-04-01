import 'package:get/get.dart';
import 'package:vis_mobile/app/data/providers/detail_po_provider.dart';
import 'package:vis_mobile/app/data/providers/purchase_order_provider.dart';
import 'package:vis_mobile/app/modules/purchase_order/controller_po.dart';
import 'package:vis_mobile/app/modules/purchase_order/details/controller_detail_po.dart';

class PurchaseOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchaseOrderProvider>(() => PurchaseOrderProvider());
    Get.lazyPut<PurchaseOrderController>(() => PurchaseOrderController(purchaseOrderProvider: Get.find()));

    Get.lazyPut<DetailPOProvider>(() => DetailPOProvider());
    Get.lazyPut<DetailPOController>(() => DetailPOController(detailPOProvider: Get.find()));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vis_mobile/app/modules/purchase_order/details/controller_detail_po.dart';
import 'package:vis_mobile/app/widgets/base_card.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

class DetailPOPage extends StatelessWidget {
  const DetailPOPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Detail Purchase Order'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListDetailPO(),
      ),
    );
  }
}

class ListDetailPO extends StatelessWidget {
  ListDetailPO({super.key});
  final controller = Get.find<DetailPOController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? const Center(child: CupertinoActivityIndicator())
        : BaseRefresh(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 3));
              controller.fetchDetailPO();
            },
            child: ListView.builder(
              itemCount: controller.detailpo.length,
              itemBuilder: (context, index) {
                var gp =
                    int.parse(controller.detailpo[index].grossPrice.toString());
                var total =
                    int.parse(controller.detailpo[index].total.toString());

                controller.g_price.value = NumberFormat.currency(
                  locale: 'id_ID',
                  symbol: 'Rp ',
                ).format(gp);

                controller.total.value = NumberFormat.currency(
                  locale: 'id_ID',
                  symbol: 'Rp ',
                ).format(total);

                return BaseCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Item Code : ' + controller.detailpo[index].itemcode!,
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Item Name : ' + controller.detailpo[index].itemname!,
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Quantity : ' +
                            controller.detailpo[index].qty.toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Store : ' + controller.detailpo[index].store!,
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Gross Price : ' + controller.g_price.toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Store : ' + controller.total.toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ));
  }
}

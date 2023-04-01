import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/purchase_order.dart';
import 'package:vis_mobile/app/modules/purchase_order/controller_po.dart';
import 'package:vis_mobile/app/modules/purchase_order/details/controller_detail_po.dart';
import 'package:vis_mobile/app/widgets/base_card.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

class PurchaseOrderPage extends StatelessWidget {
  const PurchaseOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Detail Master Data'),
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: HeaderContent(),
      ),
    );
  }
}

class HeaderContent extends StatelessWidget {
  HeaderContent({super.key});
  final controller = Get.find<PurchaseOrderController>();

  @override
  Widget build(BuildContext context) {
    var po = int.parse(controller.sum_doctotal.toString());
    var out = int.parse(controller.sum_outstanding.toString());

    String total_po = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(po);

    String outstanding = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(out);

    return Obx(() => controller.isLoading.value
        ? const Center(child: CupertinoActivityIndicator())
        : Column(
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.black,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'List PO',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            controller.total_row.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Total PO',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            controller.total_po.value,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Outstanding',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            controller.outstanding.value,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: BaseRefresh(
                  onRefresh: () async {
                    await Future.delayed(const Duration(seconds: 3));
                    controller.fetchPO();
                  },
                  child: ListView(
                    children: [
                      ...controller.po
                          .map((element) => ListContent(po: element))
                          .toList()
                    ],
                  ),
                ),
              ),
            ],
          ));
  }
}

class ListContent extends StatelessWidget {
  ListContent({
    Key? key,
    required this.po,
  }) : super(key: key);

  final PurchaseOrder po;
  final controller = Get.find<DetailPOController>();

  @override
  Widget build(BuildContext context) {
    var total_po = int.parse(po.doctotal.toString());
    var total_out = int.parse(po.outstanding.toString());

    String t_po = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(total_po);

    String t_out = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(total_out);

    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Description'),
              Text(po.date!),
            ],
          ),
          const SizedBox(height: 5),
          Text(po.description!),
          const SizedBox(height: 5),
          Text('Number PO : ${po.docnum}'),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              controller.id.value = po.docnum.toString();
              print(controller.id.value);
              Get.toNamed('/detailpo');
            },
            child: Text(
              'Total PO : $t_po',
              style: const TextStyle(color: blueColor),
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {
              Get.toNamed('/detailout');
            },
            child: Text(
              'Outstanding : $t_out',
              style: const TextStyle(color: blueColor),
            ),
          ),
        ],
      ),
    );
  }
}

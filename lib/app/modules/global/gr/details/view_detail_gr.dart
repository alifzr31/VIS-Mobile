import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vis_mobile/app/data/models/detail_gr.dart';
import 'package:vis_mobile/app/modules/global/gr/details/controller_detail_gr.dart';
import 'package:vis_mobile/app/widgets/base_card.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

class DetailGrPage extends StatelessWidget {
  const DetailGrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Detail Goods Return'),
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
        child: BodyContent(),
      ),
    );
  }
}

class BodyContent extends StatelessWidget {
  BodyContent({super.key});
  final controller = Get.find<DetailGrController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CupertinoActivityIndicator())
          : BaseRefresh(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 3));
                controller.fetchDetailGr();
              },
              child: ListView(
                children: [
                  ...controller.detailgr
                      .map((element) => ListDetailGr(detailgr: element))
                      .toList()
                ],
              ),
            ),
    );
  }
}

class ListDetailGr extends StatelessWidget {
  const ListDetailGr({
    Key? key,
    required this.detailgr,
  }) : super(key: key);

  final DetailGr detailgr;

  @override
  Widget build(BuildContext context) {
    String price = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(detailgr.price);

    String total = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(detailgr.total);
    
    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Item Code : ${detailgr.itemcode}', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text('Item Name : ${detailgr.itemname}', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text('Quantity : ${detailgr.qty}', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text('Unit : ${detailgr.unit}', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text('Price : $price', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text('Total : $total', style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

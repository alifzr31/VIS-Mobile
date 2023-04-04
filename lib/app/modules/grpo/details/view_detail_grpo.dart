import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vis_mobile/app/data/models/detail_grpo.dart';
import 'package:vis_mobile/app/modules/grpo/details/controller_detail_grpo.dart';
import 'package:vis_mobile/app/widgets/base_card.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

class DetailGrpoPage extends StatelessWidget {
  const DetailGrpoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Detail Goods Receipt PO'),
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
  final controller = Get.find<DetailGrpoController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CupertinoActivityIndicator())
          : BaseRefresh(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 3));
                controller.fetchDetailGrpo();
              },
              child: ListView(
                children: [
                  ...controller.detailgrpo
                      .map((element) => ListDetailGrpo(detailgrpo: element))
                      .toList()
                ],
              ),
            ),
    );
  }
}

class ListDetailGrpo extends StatelessWidget {
  const ListDetailGrpo({
    Key? key,
    required this.detailgrpo,
  }) : super(key: key);

  final DetailGrpo detailgrpo;

  @override
  Widget build(BuildContext context) {
    String gross_price = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(detailgrpo.grossPrice);

    String total = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(detailgrpo.total);
    
    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Number PO : ${detailgrpo.noPo}', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text('Item Name : ${detailgrpo.itemname}', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text('Quantity : ${detailgrpo.qty}', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text('Unit : ${detailgrpo.unit}', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text('Gross Price : $gross_price', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text('Total : $total', style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

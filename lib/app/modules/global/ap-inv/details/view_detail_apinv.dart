import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vis_mobile/app/data/models/detail_apinv.dart';
import 'package:vis_mobile/app/modules/global/ap-inv/details/controller_detail_apinv.dart';
import 'package:vis_mobile/app/widgets/base_card.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

class DetailApInvPage extends StatelessWidget {
  const DetailApInvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Detail AP Invoice'),
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

  final controller = Get.find<DetailApInvController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CupertinoActivityIndicator())
          : BaseRefresh(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 3));
                controller.fetchApInv();
              },
              child: ListView(
                children: [
                  ...controller.detailapinv
                      .map((element) => ListDetailApInv(detailapinv: element))
                      .toList()
                ],
              ),
            ),
    );
  }
}

class ListDetailApInv extends StatelessWidget {
  const ListDetailApInv({
    Key? key,
    required this.detailapinv,
  }) : super(key: key);

  final DetailApInv detailapinv;

  @override
  Widget build(BuildContext context) {
    String total = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp '
    ).format(detailapinv.total);
    
    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('GRPO Number : ${detailapinv.noGrpo}', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text('Delivery Number : ${detailapinv.deliveryNumber}', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text('Date of GRPO : ${detailapinv.grpoDate}', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text('Total : $total', style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

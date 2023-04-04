import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vis_mobile/app/data/models/detail_apmem.dart';
import 'package:vis_mobile/app/modules/global/ap-mem/details/controller_detail_apmem.dart';
import 'package:vis_mobile/app/widgets/base_card.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

class DetailApMemPage extends StatelessWidget {
  const DetailApMemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Detail AP Credit Memo'),
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
  final controller = Get.find<DetailApMemController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CupertinoActivityIndicator())
          : BaseRefresh(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 3));
                controller.fetchDetailApMem();
              },
              child: ListView(
                children: [
                  ...controller.detailapmem
                      .map((element) => ListDetailApMem(detailapmem: element))
                      .toList()
                ],
              ),
            ),
    );
  }
}

class ListDetailApMem extends StatelessWidget {
  const ListDetailApMem({
    Key? key,
    required this.detailapmem,
  }) : super(key: key);

  final DetailApMem detailapmem;

  @override
  Widget build(BuildContext context) {
    String price = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(detailapmem.price);

    String total = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(detailapmem.total);
    
    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (detailapmem.itemcode == null)
          Text('Item Code : -', style: const TextStyle(fontSize: 12))
          else
          Text('Item Code : ${detailapmem.itemcode}', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text('Item Name : ${detailapmem.itemname}', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text('Quantity : ${detailapmem.qty}', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          if (detailapmem.unit == null)
          Text('Unit : -', style: const TextStyle(fontSize: 12))
          else
          Text('Unit : ${detailapmem.unit}', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text('Price : $price', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text('Total : $total', style: const TextStyle(fontSize: 12)),
          // CHANGE DATA TYPE PRICE AND TOTAL IN JSON FROM STRING TO INTEGER
        ],
      ),
    );
  }
}

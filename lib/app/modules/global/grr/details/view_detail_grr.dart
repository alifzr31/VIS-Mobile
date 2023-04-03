import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vis_mobile/app/data/models/detail_grr.dart';
import 'package:vis_mobile/app/modules/global/grr/details/controller_detail_grr.dart';
import 'package:vis_mobile/app/widgets/base_card.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

class DetailGrrPage extends StatelessWidget {
  const DetailGrrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Detail GR Request'),
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
  final controller = Get.find<DetailGrrController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CupertinoActivityIndicator())
          : BaseRefresh(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 3));
                controller.fetchDetailGrr();
              },
              child: ListView(
                children: [
                  ...controller.detailgrr
                      .map((element) => ListDetailGrr(detailgrr: element))
                      .toList()
                ],
              ),
            ),
    );
  }
}

class ListDetailGrr extends StatelessWidget {
  const ListDetailGrr({
    Key? key,
    required this.detailgrr,
  }) : super(key: key);

  final DetailGrr detailgrr;

  @override
  Widget build(BuildContext context) {
    // var prc = detailgrr.price.toString();
    
    String price = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(detailgrr.price);

    String total = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(detailgrr.total);

    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PO Number : ${detailgrr.noPo}',
            style: const TextStyle(fontSize: 12),
          ),
          Text(
            'Item Name : ${detailgrr.itemname}',
            style: const TextStyle(fontSize: 12),
          ),
          Text(
            'Quantity : ${detailgrr.qty}',
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 5),
          Text(
            'Unit : ${detailgrr.unit}',
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 5),
          Text(
            'Price : ${price}',
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 5),
          Text(
            'Total : ${total}',
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

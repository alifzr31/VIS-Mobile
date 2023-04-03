import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/data/models/master_data_detail.dart';
import 'package:vis_mobile/app/modules/details/master_data/controller_master_data_detail.dart';
import 'package:vis_mobile/app/widgets/base_card.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

class MasterDataDetailPage extends StatelessWidget {
  const MasterDataDetailPage({super.key});

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
  final controller = Get.find<MasterDataDetailController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CupertinoActivityIndicator())
          : controller.masterdatadetail.length == 0
              ? BaseRefresh(
                  onRefresh: () async {
                    await Future.delayed(const Duration(seconds: 3));
                    controller.fetchMasterDataDetail();
                  },
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                  ),
                )
              : BaseRefresh(
                  onRefresh: () async {
                    await Future.delayed(const Duration(seconds: 3));
                    controller.fetchMasterDataDetail();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vendor Name : ${controller.masterdatadetail[0].cardname}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Item Name : ${controller.masterdatadetail[0].itemname}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Item Code : ${controller.masterdatadetail[0].itemncode}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView(
                          children: [
                            ...controller.masterdatadetail
                                .map((element) =>
                                    BodyContent(masterdatadetail: element))
                                .toList()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}

class BodyContent extends StatelessWidget {
  const BodyContent({
    Key? key,
    required this.masterdatadetail,
  }) : super(key: key);

  final MasterDataDetail masterdatadetail;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: () {
        print(masterdatadetail.warehouseName);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Warehouse: ${masterdatadetail.warehouse}'),
          Text('Warehouse Name: ${masterdatadetail.warehouseName}'),
          Text('In Stock: ${masterdatadetail.instock}'),
          Text('Commited in: ${masterdatadetail.commitedIn}'),
          Text('On Order: ${masterdatadetail.onOrderpo}'),
          Text('Available: ${masterdatadetail.available}'),
        ],
      ),
    );
  }
}

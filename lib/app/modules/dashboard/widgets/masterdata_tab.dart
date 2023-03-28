import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/data/models/master_data.dart';
import 'package:vis_mobile/app/modules/dashboard/controllers/masterdata_controller.dart';

class MasterDataTab extends StatefulWidget {
  const MasterDataTab({super.key});

  @override
  State<MasterDataTab> createState() => _MasterDataTabState();
}

class _MasterDataTabState extends State<MasterDataTab> {
  final controller = Get.find<MasterDataController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                const Text(
                  'List Item Master Data',
                  style: TextStyle(fontSize: 26),
                ),
                Text(
                  'Total '+controller.masterdata.length.toString()+' Stock',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListData(),
            ),
          ),
        ],
      ),
    );
  }
}

class ListData extends StatelessWidget {
  ListData({super.key});
  final controller = Get.find<MasterDataController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 3));
                controller.fetchMasterData();
              },
              child: ListView(
                children: [
                  ...controller.masterdata
                      .map(
                        (element) => CardData(masterdata: element),
                      )
                      .toList(),
                ],
              )),
    );
  }
}

class CardData extends StatelessWidget {
  const CardData({
    Key? key,
    required this.masterdata,
  }) : super(key: key);

  final MasterData masterdata;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.grey.shade400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Vendor Code : ' + masterdata.code!),
              Text('Item Name : ' + masterdata.name!),
              Text('Stock : ' + masterdata.stock.toString())
            ],
          ),
        ),
      ),
    );
  }
}

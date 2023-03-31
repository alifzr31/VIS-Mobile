import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/modules/dashboard/controllers/masterdata_controller.dart';
import 'package:vis_mobile/app/modules/details/master_data/controller_master_data_detail.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

class MasterDataTab extends StatelessWidget {
  const MasterDataTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            HeaderContent(),
            const SizedBox(height: 10),
            Expanded(child: ListMasterData()),
          ],
        ),
      ),
    );
  }
}

class HeaderContent extends StatelessWidget {
  HeaderContent({super.key});
  final controller = Get.find<MasterDataController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            'List Item Master Data',
            style: TextStyle(fontSize: 26),
          ),
        ),
        Center(
          child: Text(
            'Total ' + controller.masterdata.length.toString() + ' Stock',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}

class ListMasterData extends StatelessWidget {
  ListMasterData({super.key});
  final controller = Get.find<MasterDataController>();
  final ctrl = Get.find<MasterDataDetailController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CupertinoActivityIndicator())
          : BaseRefresh(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 3));
                controller.fetchMasterData();
              },
              child: ListView.builder(
                itemCount: controller.masterdata.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    color: Colors.grey.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: InkWell(
                      onTap: () async {
                        ctrl.id.value = controller.masterdata[index].code!;
                        Get.toNamed('/masterdatadetail');
                      },
                      splashColor: Colors.black.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vendor Code : ' +
                                  controller.masterdata[index].code!,
                              style: const TextStyle(color: Colors.black),
                            ),
                            Text(
                              'Item Name : ' +
                                  controller.masterdata[index].name!,
                              style: const TextStyle(color: Colors.black),
                            ),
                            Text(
                              'Stock : ' +
                                  controller.masterdata[index].stock.toString(),
                              style: const TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}

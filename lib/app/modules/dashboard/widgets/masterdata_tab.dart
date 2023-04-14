import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/modules/dashboard/controllers/masterdata_controller.dart';
import 'package:vis_mobile/app/modules/details/master_data/controller_master_data_detail.dart';
import 'package:vis_mobile/app/widgets/base_datatable.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: BaseRefresh(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 3));
            setState(() {
              controller.masterdata.refresh();
            });
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Column(
                children: [
                  HeaderContent(),
                  const SizedBox(height: 10),
                  Expanded(child: ListMasterData()),
                ],
              ),
            ),
          ),
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
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            // 'Total ' + controller.stok.value.toString() + ' Stock',
            'Total ' + controller.total_row.value.toString() + ' Stock',
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
          : BaseDataTable(
              columns: const [
                DataColumn2(
                  label: const Center(child: Text('Vendor Code')),
                  size: ColumnSize.L,
                  fixedWidth: 100,
                ),
                DataColumn(
                  label: const Center(child: Text('Item Name')),
                ),
                DataColumn(
                  label: const Center(child: Text('Stock')),
                ),
                DataColumn(
                  label: const Center(child: Text('Action')),
                ),
              ],
              rows: <DataRow>[
                ...controller.masterdata
                    .map(
                      (element) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(element.code.toString())),
                          DataCell(Text(element.name.toString())),
                          DataCell(
                              Center(child: Text(element.stock.toString()))),
                          DataCell(
                            onTap: () async {
                              ctrl.id.value = element.code!;
                              print(ctrl.id.value);
                              Get.toNamed('/masterdatadetail');
                            },
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.find_in_page),
                                Text('Show Detail'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList()
              ],
            ),
    );
  }
}

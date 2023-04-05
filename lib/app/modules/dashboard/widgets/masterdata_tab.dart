import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/modules/dashboard/controllers/masterdata_controller.dart';
import 'package:vis_mobile/app/modules/details/master_data/controller_master_data_detail.dart';
import 'package:vis_mobile/app/widgets/base_datatable.dart';
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
                  label: Center(child: Text('Vendor Code')),
                  size: ColumnSize.L,
                  fixedWidth: 100,
                ),
                DataColumn(
                  label: Center(child: Text('Item Name')),
                ),
                DataColumn(
                  label: Center(child: Text('Stock')),
                ),
                DataColumn(
                  label: Center(child: Text('Action')),
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

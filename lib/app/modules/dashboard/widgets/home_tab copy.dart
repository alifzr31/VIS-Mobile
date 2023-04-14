import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:vis_mobile/app/modules/dashboard/controllers/ranking_controller.dart';
import 'package:vis_mobile/app/modules/dashboard/controllers/report_controller.dart';
import 'package:vis_mobile/app/modules/dashboard/controllers/user_controller.dart';
import 'package:vis_mobile/app/widgets/base_datatable.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:vis_mobile/app/widgets/base_datetimepicker.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

class HomeTab3 extends StatefulWidget {
  const HomeTab3({super.key});

  @override
  State<HomeTab3> createState() => _HomeTab3State();
}

class _HomeTab3State extends State<HomeTab3>
    with SingleTickerProviderStateMixin {
  final ctrl_user = Get.find<UserController>();
  final ctrl_rank = Get.find<RankingController>();
  final ctrl_report = Get.find<ReportController>();

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: BaseRefresh(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 3));
            setState(() {
              ctrl_user.profile.refresh();
              ctrl_rank.rankingbfmonth.refresh();
              ctrl_rank.rankingthismonth.refresh();
              ctrl_report.reportytmonth.refresh();
              ctrl_report.reportytdate.refresh();
            });
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                ContentBody(),
                const Divider(),
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Ranking Before Month'),
                    Tab(text: 'Ranking This Month'),
                    Tab(text: 'Month to Date'),
                    Tab(text: 'Years to Date'),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.5,
                  width: Get.width,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListRankingBfMonth(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListRangkingThisMonth(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListReport(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListReportYear(),
                      ),
                    ],
                  ),
                ),
                // const Divider(),
                // ListRankingBfMonth(),
                // const Divider(),
                // ListRangkingThisMonth(),
                // const Divider(),
                // ListReport(),
                // const Divider(),
                // ListReportYear(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContentBody extends StatelessWidget {
  ContentBody({super.key});
  final controller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    var format = DateFormat('dd MMMM yyyy - HH:mm');
    final now = format.format(date);

    List<Widget> cards = [
      CardBody(
        label: 'Purchase Order',
        currency: controller.total_po.value,
        icon: FontAwesome.file_lines,
        onTap: () {
          Get.toNamed('/po');
        },
      ),
      CardBody(
        label: 'Goods Receipt PO',
        currency: controller.total_grpo.value,
        icon: FontAwesome.file,
        onTap: () {
          Get.toNamed('/grpo');
        },
      ),
      CardBody(
        label: 'Goods Return Request',
        currency: controller.total_grr.value,
        icon: FontAwesome.box,
        onTap: () {
          Get.toNamed('/grr');
        },
      ),
      CardBody(
        label: 'Goods Return',
        currency: controller.total_gr.value,
        icon: FontAwesome.box_archive,
        onTap: () {
          Get.toNamed('/gr');
        },
      ),
      CardBody(
        label: 'AP Invoice',
        currency: controller.total_ap_inv.value,
        icon: FontAwesome.folder,
        onTap: () {
          Get.toNamed('/apinv');
        },
      ),
      CardBody(
        label: 'AP Credit Memo',
        currency: controller.total_ap_mem.value,
        icon: FontAwesome.folder_open,
        onTap: () {
          Get.toNamed('/apmem');
        },
      ),
    ];

    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CupertinoActivityIndicator())
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.dash.value!.namaVendor!.capitalize.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(now.toString()),
                  ],
                ),
                const Divider(height: 5),
                Container(
                  height: 2,
                  color: Colors.black,
                ),
                const Divider(height: 5),
                SizedBox(
                  width: Get.width,
                  height: 200,
                  child: Swiper(
                    itemCount: cards.length,
                    pagination: SwiperPagination(),
                    curve: Curves.bounceOut,
                    itemBuilder: (context, index) {
                      return cards[index];
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

class CardBody extends StatelessWidget {
  const CardBody({
    Key? key,
    required this.icon,
    this.onTap,
    required this.label,
    required this.currency,
  }) : super(key: key);

  final IconData icon;
  final void Function()? onTap;
  final String label;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                size: 80,
                color: Colors.white,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(height: 3),
                  Text(
                    currency,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListRankingBfMonth extends StatelessWidget {
  ListRankingBfMonth({super.key});
  final controller = Get.find<RankingController>();

  @override
  Widget build(BuildContext context) {
    // var mo = '2023-${controller.prev_month.value}-01 00:00:00.000';
    // var m = DateFormat('M').parse(mo);
    // var format = DateFormat('MMMM');
    // final month = format.format(m);
    // print(m);
    // var formatmonth = DateFormat('MMMM');
    // final month = formatmonth.format(m);

    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CupertinoActivityIndicator())
          : SizedBox(
              height: Get.height * 0.50,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ranking Before Month',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        controller.prev_month.toString() +
                            ' - ' +
                            controller.this_year.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Divider(),
                  Container(
                    color: Colors.black,
                    height: 2,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        ...controller.rankingbfmonth
                            .map(
                              (element) => Container(
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide())),
                                child: ListTile(
                                  onTap: () {},
                                  leading: Text(element.ranking.toString()),
                                  title: Text(element.vendor!,
                                      style: const TextStyle(fontSize: 14)),
                                  // subtitle: Text(element.brand!),
                                  trailing: Text(element.brand!,
                                      style: const TextStyle(fontSize: 12)),
                                ),
                              ),
                            )
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

class ListRangkingThisMonth extends StatelessWidget {
  ListRangkingThisMonth({super.key});
  final controller = Get.find<RankingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: Get.height * 0.50,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Ranking This Month',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  controller.this_month.toString() +
                      ' - ' +
                      controller.this_year.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(),
            Container(
              color: Colors.black,
              height: 2,
            ),
            Expanded(
              child: ListView(
                children: [
                  ...controller.rankingthismonth
                      .map(
                        (element) => Container(
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide())),
                          child: ListTile(
                            onTap: () {},
                            leading: Text(element.ranking.toString()),
                            title: Text(element.vendor!,
                                style: const TextStyle(fontSize: 14)),
                            // subtitle: Text(element.brand!),
                            trailing: Text(element.brand!,
                                style: const TextStyle(fontSize: 12)),
                          ),
                        ),
                      )
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

class ListReport extends StatelessWidget {
  ListReport({super.key});
  final controller = Get.find<ReportController>();

  @override
  Widget build(BuildContext context) {
    final total_awal = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(controller.total_awal.value);

    final total_akhir = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(controller.total_akhir.value);

    final sum = controller.total_akhir.value - controller.total_awal.value;
    final summary = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(sum);

    var jumlah = sum / controller.total_awal.value;
    final percent = (jumlah * 100).toStringAsFixed(0);

    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CupertinoActivityIndicator())
          : SizedBox(
              height: Get.height * 0.85,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Report Month to Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(),
                  Container(
                    color: Colors.black,
                    height: 2,
                  ),
                  const Divider(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total ${controller.start_awal} - ${controller.end_awal} :',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Divider(height: 3),
                        Text(total_awal),
                        const Divider(height: 5),
                        Text(
                          'Total ${controller.start_akhir} - ${controller.end_akhir} :',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Divider(height: 3),
                        Text(total_akhir),
                        const Divider(height: 5),
                        Text(
                          'Summary :',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Divider(height: 3),
                        Text(summary),
                        const Divider(height: 5),
                        Text(
                          'Summary Percentage :',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Divider(height: 3),
                        Text('$percent%'),
                      ],
                    ),
                  ),
                  const Divider(height: 5),
                  Expanded(
                    child: BaseDataTable(
                      columns: [
                        DataColumn2(
                          label: const Text('Branch Name'),
                          size: ColumnSize.S,
                          fixedWidth: 200,
                        ),
                        DataColumn2(
                          label: Text(controller.start_awal.value +
                              ' - ' +
                              controller.end_awal.value),
                          size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text(controller.start_akhir.value +
                              ' - ' +
                              controller.end_akhir.value),
                          size: ColumnSize.L,
                        ),
                        DataColumn(
                          label: const Center(child: Text('Percentage (%)')),
                        ),
                      ],
                      rows: [
                        ...controller.reportytmonth.map((element) {
                          var selisih = int.parse(element.col3.toString()) -
                              int.parse(element.col2.toString());
                          var jumlah =
                              selisih / int.parse(element.col2.toString());
                          final percent = (jumlah * 100).toStringAsFixed(2);

                          final col2 = NumberFormat.currency(
                            locale: 'id_ID',
                            symbol: 'Rp ',
                          ).format(element.col2);

                          final col3 = NumberFormat.currency(
                            locale: 'id_ID',
                            symbol: 'Rp ',
                          ).format(element.col3);

                          return DataRow(
                            cells: [
                              DataCell(Text(element.branchName!)),
                              DataCell(Text(col2)),
                              DataCell(Text(col3)),
                              if (jumlah < 0)
                                DataCell(Center(
                                    child: Text(
                                  '$percent %',
                                  style: const TextStyle(color: Colors.red),
                                )))
                              else
                                DataCell(Center(child: Text('$percent%'))),
                            ],
                          );
                        }).toList()
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class ListReportYear extends StatelessWidget {
  ListReportYear({super.key});
  final controller = Get.find<ReportController>();

  @override
  Widget build(BuildContext context) {
    final total_awal = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(controller.total_awal_year.value);

    final total_akhir = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(controller.total_akhir_year.value);

    final sum =
        controller.total_akhir_year.value - controller.total_awal_year.value;
    final summary = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(sum);

    var jumlah = sum / controller.total_awal_year.value;
    final percent = (jumlah * 100).toStringAsFixed(0);

    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CupertinoActivityIndicator())
          : SizedBox(
              height: Get.height * 0.90,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Report Years to Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(),
                  Container(
                    color: Colors.black,
                    height: 2,
                  ),
                  const Divider(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total ${controller.start_awal} - ${controller.end_awal} :',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Divider(height: 3),
                        Text(total_awal),
                        const Divider(height: 5),
                        Text(
                          'Total ${controller.start_akhir} - ${controller.end_akhir} :',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Divider(height: 3),
                        Text(total_akhir),
                        const Divider(height: 5),
                        Text(
                          'Summary :',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Divider(height: 3),
                        Text(summary),
                        const Divider(height: 5),
                        Text(
                          'Summary Percentage :',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Divider(height: 3),
                        Text('$percent%'),
                      ],
                    ),
                  ),
                  const Divider(height: 5),
                  Expanded(
                    child: BaseDataTable(
                      columns: [
                        DataColumn2(
                          label: const Text('Branch Name'),
                          size: ColumnSize.S,
                          fixedWidth: 200,
                        ),
                        DataColumn2(
                          label: Text(controller.start_awal.value +
                              ' - ' +
                              controller.end_awal.value),
                          size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text(controller.start_akhir.value +
                              ' - ' +
                              controller.end_akhir.value),
                          size: ColumnSize.L,
                        ),
                        DataColumn(
                          label: const Center(child: Text('Percentage (%)')),
                        ),
                      ],
                      rows: [
                        ...controller.reportytdate.map((element) {
                          var selisih = int.parse(element.col3.toString()) -
                              int.parse(element.col2.toString());
                          var jumlah =
                              selisih / int.parse(element.col2.toString());
                          final percent = (jumlah * 100).toStringAsFixed(2);

                          final col2 = NumberFormat.currency(
                            locale: 'id_ID',
                            symbol: 'Rp ',
                          ).format(element.col2);

                          final col3 = NumberFormat.currency(
                            locale: 'id_ID',
                            symbol: 'Rp ',
                          ).format(element.col3);

                          return DataRow(
                            cells: [
                              DataCell(Text(element.branchName!)),
                              DataCell(Text(col2)),
                              DataCell(Text(col3)),
                              if (jumlah < 0)
                                DataCell(Center(
                                    child: Text(
                                  '$percent %',
                                  style: const TextStyle(color: Colors.red),
                                )))
                              else
                                DataCell(Center(child: Text('$percent%'))),
                            ],
                          );
                        }).toList()
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

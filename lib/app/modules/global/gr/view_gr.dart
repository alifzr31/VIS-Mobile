import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/global_model.dart';
import 'package:vis_mobile/app/modules/global/global_controller.dart';
import 'package:vis_mobile/app/modules/global/gr/details/controller_detail_gr.dart';
import 'package:vis_mobile/app/widgets/base_card.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

class GrPage extends StatelessWidget {
  const GrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Goods Return'),
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
  final controller = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CupertinoActivityIndicator())
          : Column(
              children: [
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'List Goods Return',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              controller.total_row_gr.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Total Goods Return',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              controller.totalgr.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BaseRefresh(
                    onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 3));
                      controller.fetchGr();
                    },
                    child: ListView(
                      children: [
                        ...controller.gr
                            .map((element) => ListGr(gr: element))
                            .toList()
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class ListGr extends StatelessWidget {
  ListGr({
    Key? key,
    required this.gr,
  }) : super(key: key);

  final GlobalModel gr;
  final controller = Get.find<DetailGrController>();

  @override
  Widget build(BuildContext context) {
    var t_gr = int.parse(gr.doctotal.toString());

    String total_gr = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(t_gr);

    return BaseCard(
      onTap: () {
        controller.id.value = gr.docnum.toString();
        Get.toNamed('/detailgr');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description : ${gr.description}',
              style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text(
            'Goods Return Number : ${gr.docnum}',
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Goods Return : $total_gr',
                style: const TextStyle(
                  fontSize: 12,
                  color: blueColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                gr.date!,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

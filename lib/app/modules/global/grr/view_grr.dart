import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/global_model.dart';
import 'package:vis_mobile/app/modules/global/global_controller.dart';
import 'package:vis_mobile/app/modules/global/grr/details/controller_detail_grr.dart';
import 'package:vis_mobile/app/widgets/base_card.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

class GrrPage extends StatelessWidget {
  const GrrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Goods Return Request'),
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
                              'List GR Req',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              controller.total_row_grr.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Total GR Req',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              controller.totalgrr.toString(),
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
                      controller.fetchGRR();
                    },
                    child: ListView(
                      children: [
                        ...controller.grr
                            .map((element) => ListGRR(grr: element))
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

class ListGRR extends StatelessWidget {
  ListGRR({
    Key? key,
    required this.grr,
  });

  final GlobalModel grr;
  final controller = Get.find<DetailGrrController>();

  @override
  Widget build(BuildContext context) {
    var t_grr = int.parse(grr.doctotal.toString());

    String total_grr = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(t_grr);

    return BaseCard(
      onTap: () {
        controller.id.value = grr.docnum.toString();
        print(controller.id.value);
        Get.toNamed('/detailgrr');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description : ${grr.description}',
              style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text(
            'Number GRR : ${grr.docnum}',
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total GRR : $total_grr',
                style: const TextStyle(
                  fontSize: 12,
                  color: blueColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                grr.date!,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

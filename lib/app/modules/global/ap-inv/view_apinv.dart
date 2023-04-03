import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/global_model.dart';
import 'package:vis_mobile/app/modules/global/ap-inv/details/controller_detail_apinv.dart';
import 'package:vis_mobile/app/modules/global/global_controller.dart';
import 'package:vis_mobile/app/widgets/base_card.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

class ApInvPage extends StatelessWidget {
  const ApInvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('AP Invoice'),
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
                              'List AP Inv',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              controller.total_row_apinv.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Total AP Inv',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              controller.totalapinv.toString(),
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
                      controller.fetchApInv();
                    },
                    child: ListView(
                      children: [
                        ...controller.apinv
                            .map((element) => ListApInv(apinv: element))
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

class ListApInv extends StatelessWidget {
  ListApInv({
    Key? key,
    required this.apinv,
  }) : super(key: key);

  final GlobalModel apinv;
  final controller = Get.find<DetailApInvController>();

  @override
  Widget build(BuildContext context) {
    var t_apinv = int.parse(apinv.doctotal.toString());

    String total_apinv = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(t_apinv);

    return BaseCard(
      onTap: () {
        controller.id.value = apinv.docnum.toString();
        Get.toNamed('/detailapinv');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Origin : ${apinv.description}',
              style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text(
            'Number AP Invoice : ${apinv.docnum}',
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'AP Invoice : $total_apinv',
                style: const TextStyle(
                  fontSize: 12,
                  color: blueColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                apinv.date!,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

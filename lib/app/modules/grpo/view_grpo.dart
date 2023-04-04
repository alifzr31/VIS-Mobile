import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/grpo.dart';
import 'package:vis_mobile/app/modules/grpo/controller_grpo.dart';
import 'package:vis_mobile/app/modules/grpo/details/controller_detail_grpo.dart';
import 'package:vis_mobile/app/widgets/base_card.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

class GrpoPage extends StatelessWidget {
  const GrpoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Goods Receipt PO'),
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
  final controller = Get.find<GrpoController>();

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
                              'List Goods Receipt PO',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              controller.total_row_grpo.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                        // Column(
                        //   children: [
                        //     const Text(
                        //       'Total Goods Return',
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //         fontWeight: FontWeight.w600,
                        //       ),
                        //     ),
                        //     const SizedBox(height: 5),
                        //     Text(
                        //       controller.totalgr.toString(),
                        //       style: const TextStyle(
                        //           color: Colors.white, fontSize: 12),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BaseRefresh(
                    onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 3));
                      controller.fetchGrpo();
                    },
                    child: ListView(
                      children: [
                        ...controller.grpo
                            .map((element) => ListGrpo(grpo: element))
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

class ListGrpo extends StatelessWidget {
  ListGrpo({
    Key? key,
    required this.grpo,
  }) : super(key: key);

  final Grpo grpo;
  final controller = Get.find<DetailGrpoController>();

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: () {
        controller.id.value = grpo.docGrpo.toString();
        Get.toNamed('/detailgrpo');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('No. SJ : ${grpo.noSj}',
                  style: const TextStyle(fontSize: 12)),
              Text('${grpo.tglGrpo}', style: const TextStyle(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 5),
          Text('Branch : ${grpo.branch}', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text('Goods Receipt PO Number : ${grpo.docGrpo}',
              style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 10),
          Text(
            'Goods Receipt PO : ${grpo.amountGrpo}',
            style: const TextStyle(
              fontSize: 12,
              color: blueColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'GRPO/GRN : ${grpo.amountgrpoAmountgrn}',
            style: const TextStyle(
              fontSize: 12,
              color: blueColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/global_model.dart';
import 'package:vis_mobile/app/modules/global/global_controller.dart';
import 'package:vis_mobile/app/widgets/base_card.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

class ApMemPage extends StatelessWidget {
  const ApMemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('AP Credit Memo'),
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
                              'List AP Credit Memo',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              controller.total_row_apmem.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Total AP Credit Memo',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              controller.totalapmem.toString(),
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
                      controller.fetchApMem();
                    },
                    child: ListView(
                      children: [
                        ...controller.apmem
                            .map((element) => ListApMem(apmem: element))
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

class ListApMem extends StatelessWidget {
  const ListApMem({
    Key? key,
    required this.apmem,
  }) : super(key: key);

  final GlobalModel apmem;

  @override
  Widget build(BuildContext context) {
    var t_apmem = int.parse(apmem.doctotal.toString());

    String total_apmem = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(t_apmem);
    
    return BaseCard(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description : ${apmem.description}',
              style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text(
            'Goods Return Number : ${apmem.docnum}',
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Goods Return : $total_apmem',
                style: const TextStyle(
                  fontSize: 12,
                  color: blueColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                apmem.date!,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

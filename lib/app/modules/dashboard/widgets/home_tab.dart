import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:vis_mobile/app/modules/dashboard/controllers/user_controller.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            HeaderBody(),
            const SizedBox(height: 10),
            Expanded(
              child: ContentBody(),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderBody extends StatelessWidget {
  HeaderBody({super.key});
  final controller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 2,
            color: Colors.grey,
          ),
          const SizedBox(height: 10),
          Obx(
            () => controller.isLoading.value
                ? SizedBox(
                    height: 80,
                    child: const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                HeroIcons.user_circle,
                                size: 28,
                              ),
                              const SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.dash.value!.namaVendor
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    controller.dash.value!.kodeVendor
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                FontAwesome.file,
                                size: 28,
                              ),
                              const SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Federal Tax ID',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    controller.profile.value!.federalTaxId
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: Get.width * 0.10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                IonIcons.mail,
                                size: 28,
                              ),
                              const SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Vendor Email',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    controller.profile.value!.email.toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                HeroIcons.device_phone_mobile,
                                size: 28,
                              ),
                              const SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Vendor Mobile',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    controller.profile.value!.mobilePhone
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 2,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class ContentBody extends StatefulWidget {
  ContentBody({super.key});

  @override
  State<ContentBody> createState() => _ContentBodyState();
}

class _ContentBodyState extends State<ContentBody> {
  final controller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    var po = int.parse(controller.totalPO.toString());
    var grpo = int.parse(controller.totalGRPO.toString());
    var gr = int.parse(controller.totalGR.toString());
    var grr = int.parse(controller.totalGRR.toString());
    var apmem = int.parse(controller.totalAPMEM.toString());
    var apinv = int.parse(controller.totalAPINV.toString());

    String total_po = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(po);

    String total_grpo = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(grpo);

    String total_gr = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(gr);

    String total_grr = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(grr);

    String total_apmem = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(apmem);

    String total_apinv = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(apinv);

    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CupertinoActivityIndicator())
          : BaseRefresh(
            onRefresh: () async {
              setState(() {
                controller.fetchProfile();
              });
            },
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CardBody(
                        icon: FontAwesome.file,
                        onTap: () {
                          print('PO');
                        },
                      ),
                      const Text(
                        'Purchase Order',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        total_po,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      CardBody(
                        icon: FontAwesome.box,
                        onTap: () {
                          print('GRR');
                        },
                      ),
                      const Text(
                        'Goods Return Request',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        total_grr,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      CardBody(
                        icon: FontAwesome.folder,
                        onTap: () {
                          print('AP Invoice');
                        },
                      ),
                      const Text(
                        'AP Invoice',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        total_apinv,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CardBody(
                        icon: FontAwesome.file,
                        onTap: () {
                          print('GRPO');
                        },
                      ),
                      const Text(
                        'Goods Receipt PO',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        total_grpo,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      CardBody(
                        icon: FontAwesome.box_archive,
                        onTap: () {
                          print('GR');
                        },
                      ),
                      const Text(
                        'Goods Return',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        total_gr,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      CardBody(
                        icon: FontAwesome.folder_open,
                        onTap: () {
                          print('AP Credit Memo');
                        },
                      ),
                      const Text(
                        'AP Credit Memo',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        total_apmem,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
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

class CardBody extends StatelessWidget {
  const CardBody({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final void Function()? onTap;

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
          padding: const EdgeInsets.all(30.0),
          child: Icon(
            icon,
            size: 80,
            // color: Color.fromARGB(255, 21, 114, 161),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

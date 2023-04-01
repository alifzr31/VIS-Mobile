import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/purchase_order.dart';
import 'package:vis_mobile/app/data/providers/purchase_order_provider.dart';

class PurchaseOrderController extends GetxController {
  final PurchaseOrderProvider purchaseOrderProvider;

  PurchaseOrderController({required this.purchaseOrderProvider});

  var isLoading = true.obs;
  final po = <PurchaseOrder>[].obs;
  final total_row = 0.obs;
  final sum_doctotal = 0.obs;
  final sum_outstanding = 0.obs;
  final total_po = ''.obs;
  final outstanding = ''.obs;

  @override
  void onInit() {
    fetchPO();
    super.onInit();
  }

  void fetchPO() async {
    try {
      final response = await purchaseOrderProvider.fetchPO();
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        total_row.value = body['total_row'];

        sum_doctotal.value = body['sum_doctotal'];
        sum_outstanding.value = body['sum_outstanding'];

        total_po.value = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp ',
        ).format(sum_doctotal.value);

        outstanding.value = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp ',
        ).format(sum_outstanding.value);

        po.value = body['data'] == null
            ? []
            : listPurchaseOrderFromJson(jsonEncode(body['data']));
        update();
      } else {
        Get.snackbar(
          'Failed',
          '${response.statusCode}',
          backgroundColor: Colors.amber.withOpacity(0.8),
          colorText: blueColor,
          icon: const Icon(Icons.warning, color: blueColor),
        );
      }
    } on IOException {
      Get.snackbar(
        'Failed',
        'Something went wrong',
        backgroundColor: Colors.amber.withOpacity(0.8),
        colorText: blueColor,
        icon: const Icon(Icons.warning, color: blueColor),
      );
    }

    isLoading.value = false;
    update();
  }
}

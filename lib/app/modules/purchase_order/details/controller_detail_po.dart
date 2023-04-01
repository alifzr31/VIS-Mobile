import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/detail_po.dart';
import 'package:vis_mobile/app/data/providers/detail_po_provider.dart';

class DetailPOController extends GetxController {
  final DetailPOProvider detailPOProvider;

  DetailPOController({required this.detailPOProvider});

  var isLoading = true.obs;
  var detailpo = <DetailPo>[].obs;
  var detailout = <DetailPo>[].obs;
  var id = ''.obs;
  final g_price = ''.obs;
  final total = ''.obs;

  @override
  void onInit() {
    id.value;
    fetchDetailPO();
    super.onInit();
  }

  void fetchDetailPO() async {
    try {
      final response = await detailPOProvider.fetchDetailPO(id.value);
      final body = jsonDecode(response.body);

      detailpo.value = body['data'] == null
          ? []
          : listDetailPoFromJson(jsonEncode(body['data']));
      update();
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

  void fetchDetailOut() async {
    try {
      final response = await detailPOProvider.fetchDetailOut(id);
      final body = jsonDecode(response.body);

      detailout.value = body['data'] == null
          ? []
          : listDetailPoFromJson(jsonEncode(body['data']));
      update();
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

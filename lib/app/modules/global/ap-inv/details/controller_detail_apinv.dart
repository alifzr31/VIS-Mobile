import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/detail_apinv.dart';
import 'package:vis_mobile/app/data/providers/detail_apinv_provider.dart';

class DetailApInvController extends GetxController {
  final DetailApInvProvider detailApInvProvider;

  DetailApInvController({required this.detailApInvProvider});

  var isLoading = true.obs;
  final total_row = 0.obs;
  var id = ''.obs;
  var detailapinv = <DetailApInv>[].obs;

  @override
  void onInit() {
    fetchApInv();
    super.onInit();
  }

  void fetchApInv() async {
    try {
      final response = await detailApInvProvider.fetchDetailApInv(id);
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        total_row.value = body['total_row'];

        detailapinv.value = body['data'] == null
            ? []
            : listDetailApInvFromJson(jsonEncode(body['data']));

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

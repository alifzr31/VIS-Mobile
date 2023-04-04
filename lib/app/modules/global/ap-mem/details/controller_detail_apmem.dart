import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/detail_apmem.dart';
import 'package:vis_mobile/app/data/providers/detail_apmem.dart';

class DetailApMemController extends GetxController {
  final DetailApMemProvider detailApMemProvider;

  DetailApMemController({required this.detailApMemProvider});

  var isLoading = true.obs;
  final total_row = 0.obs;
  var id = ''.obs;
  var detailapmem = <DetailApMem>[].obs;

  @override
  void onInit() {
    fetchDetailApMem();
    super.onInit();
  }

  void fetchDetailApMem() async {
    try {
      final response = await detailApMemProvider.fetchDetailApMem(id);
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        total_row.value = body['total_row'];

        detailapmem.value = body['data'] == null
            ? []
            : listDetailApMemFromJson(jsonEncode(body['data']));

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

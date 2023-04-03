import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/global_model.dart';
import 'package:vis_mobile/app/data/providers/global_provider.dart';

class GlobalController extends GetxController {
  final GlobalProvider globalProvider;

  GlobalController({required this.globalProvider});

  var isLoading = true.obs;
  final total_row_grr = 0.obs;
  final sum_doctotal_grr = 0.obs;
  final totalgrr = ''.obs;
  var grr = <GlobalModel>[].obs;

  final total_row_apinv = 0.obs;
  final sum_doctotal_apinv = 0.obs;
  final totalapinv = ''.obs;
  var apinv = <GlobalModel>[].obs;

  final total_row_gr = 0.obs;
  final sum_doctotal_gr = 0.obs;
  final totalgr = ''.obs;
  var gr = <GlobalModel>[].obs;

  final total_row_apmem = 0.obs;
  final sum_doctotal_apmem = 0.obs;
  final totalapmem = ''.obs;
  var apmem = <GlobalModel>[].obs;

  @override
  void onInit() {
    fetchGRR();
    fetchApInv();
    fetchGr();
    fetchApMem();
    super.onInit();
  }

  void fetchGRR() async {
    try {
      final response = await globalProvider.fetchGRR();
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        total_row_grr.value = body['total_row'];
        sum_doctotal_grr.value = body['sum_doctotal'];

        totalgrr.value = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp ',
        ).format(sum_doctotal_grr.value);

        grr.value = body['data'] == null
            ? []
            : listGlobalModelFromJson(jsonEncode(body['data']));

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

  void fetchApInv() async {
    try {
      final response = await globalProvider.fetchApInv();
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        total_row_apinv.value = body['total_row'];
        sum_doctotal_apinv.value = body['sum_doctotal'];

        totalapinv.value = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp ',
        ).format(sum_doctotal_apinv.value);

        apinv.value = body['data'] == null
            ? []
            : listGlobalModelFromJson(jsonEncode(body['data']));

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

  void fetchGr() async {
    try {
      final response = await globalProvider.fetchGr();
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        total_row_gr.value = body['total_row'];
        sum_doctotal_gr.value = body['sum_doctotal'];

        totalgr.value = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp ',
        ).format(sum_doctotal_gr.value);

        gr.value = body['data'] == null
            ? []
            : listGlobalModelFromJson(jsonEncode(body['data']));

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

  void fetchApMem() async {
    try {
      final response = await globalProvider.fetchApMem();
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        total_row_apmem.value = body['total_row'];
        sum_doctotal_apmem.value = body['sum_doctotal'];

        totalapmem.value = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp ',
        ).format(sum_doctotal_apmem.value);

        apmem.value = body['data'] == null
            ? []
            : listGlobalModelFromJson(jsonEncode(body['data']));

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

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/detail_grr.dart';
import 'package:vis_mobile/app/data/providers/detail_grr_provider.dart';

class DetailGrrController extends GetxController {
  final DetailGrrProvider detailGrrProvider;

  DetailGrrController({required this.detailGrrProvider});

  var isLoading = true.obs;
  final total_row = 0.obs;
  var id = ''.obs;
  var detailgrr = <DetailGrr>[].obs;

  @override
  void onInit() {
    fetchDetailGrr();
    super.onInit();
  }

  void fetchDetailGrr() async {
    try {
      final response = await detailGrrProvider.fetchDetailGrr(id.value);
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        total_row.value = body['total_row'];

        detailgrr.value = body['data'] == null
            ? []
            : listDetailGrrFromJson(jsonEncode(body['data']));
        
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

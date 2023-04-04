import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/detail_grpo.dart';
import 'package:vis_mobile/app/data/providers/detail_grpo_provider.dart';

class DetailGrpoController extends GetxController {
  final DetailGrpoProvider detailGrpoProvider;

  DetailGrpoController({required this.detailGrpoProvider});

  var isLoading = true.obs;
  final total_row = 0.obs;
  var id = ''.obs;
  var detailgrpo = <DetailGrpo>[].obs;

  @override
  void onInit() {
    fetchDetailGrpo();
    super.onInit();
  }

  void fetchDetailGrpo() async {
    try {
      final response = await detailGrpoProvider.fetchDetailGrpo(id);
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        total_row.value = body['total_row'];

        detailgrpo.value = body['data'] == null
            ? []
            : listDetailGrpoFromJson(jsonEncode(body['data']));

        print('Success');
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

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/grpo.dart';
import 'package:vis_mobile/app/data/providers/grpo_provider.dart';

class GrpoController extends GetxController {
  final GrpoProvider grpoProvider;

  GrpoController({required this.grpoProvider});

  var isLoading = true.obs;
  final total_row_grpo = 0.obs;
  var grpo = <Grpo>[].obs;

  @override
  void onInit() {
    fetchGrpo();
    super.onInit();
  }

  void fetchGrpo() async {
    try {
      final response = await grpoProvider.fetchGrpo();
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        total_row_grpo.value = body['total_row'];

        grpo.value = body['data'] == null
            ? []
            : listGrpoFromJson(jsonEncode(body['data']));
        
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

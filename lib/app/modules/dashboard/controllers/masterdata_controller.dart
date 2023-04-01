import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/master_data.dart';
import 'package:vis_mobile/app/data/providers/master_provider.dart';

class MasterDataController extends GetxController {
  final MasterProvider masterProvider;

  MasterDataController({required this.masterProvider});

  var isLoading = true.obs;
  final masterdata = <MasterData>[].obs;
  var stok = 0.obs;

  @override
  void onInit() {
    fetchMasterData();
    stok;
    super.onInit();
  }

  void fetchMasterData() async {
    try {
      final response = await masterProvider.fetchMasterData();
      final body = jsonDecode(response.body);

      stok.value = body['total_row'];
      print(stok.value);

      masterdata.value = body['data'] == null
          ? []
          : listMasterDataFromJson(jsonEncode(body['data']));

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

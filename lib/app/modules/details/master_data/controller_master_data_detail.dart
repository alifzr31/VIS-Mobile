import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/master_data_detail.dart';
import 'package:vis_mobile/app/data/providers/master_provider.dart';

class MasterDataDetailController extends GetxController {
  final MasterProvider masterProvider;

  MasterDataDetailController({required this.masterProvider});
  var isLoading = true.obs;
  var masterdatadetail = <MasterDataDetail>[].obs;
  var id = ''.obs;

  @override
  void onInit() {
    id.value;
    fetchMasterDataDetail();
    super.onInit();
  }

  void fetchMasterDataDetail() async {
    final response = await masterProvider.fetchMasterDataDetail(id.value);
    final body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      masterdatadetail.value = body['data'] == null
          ? []
          : listMasterDataDetailFromJson(jsonEncode(body['data']));
    } 
    // else if (response.statusCode == 403) {
    //   SharedPreferences _prefs = await SharedPreferences.getInstance();
    //   Get.offAllNamed('/login');
    //   _prefs.clear();

    //   Get.snackbar(
    //     "You've been logged out",
    //     'Your session is expired. Please to log in again',
    //     backgroundColor: Colors.blue.withOpacity(0.8),
    //     colorText: Colors.white,
    //     icon: const Icon(Icons.info, color: Colors.white),
    //   );
    // } else {
    //   Get.snackbar(
    //     'Failed',
    //     'Fetching data failed',
    //     backgroundColor: Colors.amber.withOpacity(0.8),
    //     colorText: blueColor,
    //     icon: const Icon(Icons.warning, color: blueColor),
    //   );
    // }

    isLoading.value = false;
    update();
  }
}

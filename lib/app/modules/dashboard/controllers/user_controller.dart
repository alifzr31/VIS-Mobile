import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/dash.dart';
import 'package:vis_mobile/app/data/models/user.dart';
import 'package:vis_mobile/app/data/providers/user_provider.dart';

class UserController extends GetxController {
  final UserProvider userProvider;

  UserController({required this.userProvider});

  var isLoading = true.obs;
  final profile = Rx<User?>(null);
  var po = 0.obs;
  var ab = 0.obs;
  var grpo = 0.obs;

  final dash = Rx<Dash?>(null);
  var totalPO = 0.obs;
  var totalGRPO = 0.obs;
  var totalGR = 0.obs;
  var totalGRR = 0.obs;
  var totalAPMEM = 0.obs;
  var totalAPINV = 0.obs;

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  void fetchProfile() async {
    try {
      final response = await userProvider.profile();
      final body = jsonDecode(response.body);

      final res = await userProvider.dash();
      final bdy = jsonDecode(res.body);

      if (response.statusCode == 200) {
        profile.value = userFromJson(jsonEncode(body['data']));
        var _po = int.parse(body['data']['purchase_order']);
        var _ab = int.parse(body['data']['account_balance']);
        var _grpo = int.parse(body['data']['goods_receipt_po']);
        po.value = _po;
        ab.value = _ab;
        grpo.value = _grpo;
        
        dash.value = dashFromJson(jsonEncode(bdy));
        totalAPINV.value = bdy['total_ap_inv'];
        totalAPMEM.value = bdy['total_ap_mem'];
        totalGR.value = bdy['total_gr'];
        totalGRPO.value = bdy['total_grpo'];
        totalGRR.value = bdy['total_grr'];
        totalPO.value = bdy['total_po'];
        update();
      } else {
        Get.snackbar(
          'Failed',
          'Fetching data failed',
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

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/dash.dart';
import 'package:vis_mobile/app/data/models/user.dart';
import 'package:vis_mobile/app/data/providers/user_provider.dart';

class UserController extends GetxController {
  final UserProvider userProvider;

  UserController({required this.userProvider});

  var isLoading = true.obs;
  final profile = Rx<User?>(null);
  var _po = 0.obs;
  var _ab = 0.obs;
  var _grpo = 0.obs;
  final po = ''.obs;
  final ab = ''.obs;
  final grpo = ''.obs;

  final dash = Rx<Dash?>(null);
  final total_po = ''.obs;
  final total_grpo = ''.obs;
  final total_gr = ''.obs;
  final total_grr = ''.obs;
  final total_ap_mem = ''.obs;
  final total_ap_inv = ''.obs;

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
        _po.value = int.parse(body['data']['purchase_order'].toString());
        _ab.value = int.parse(body['data']['account_balance'].toString());
        _grpo.value = int.parse(body['data']['goods_receipt_po'].toString());

        po.value = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp ',
        ).format(_po.value);

        ab.value = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp ',
        ).format(_ab.value);

        grpo.value = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp ',
        ).format(_grpo.value);

        dash.value = dashFromJson(jsonEncode(bdy));
        var tPo = bdy['total_po'];
        var tGrpo = bdy['total_grpo'];
        var tGr = bdy['total_gr'];
        var tGrr = bdy['total_grr'];
        var tApm = bdy['total_ap_mem'];
        var tApi = bdy['total_ap_inv'];
        // var tGrpo = int.parse(bdy['total'].toString())

        total_po.value = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp ',
        ).format(tPo);

        total_grpo.value = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp ',
        ).format(tGrpo);

        total_gr.value = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp ',
        ).format(tGr);

        total_grr.value = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp ',
        ).format(tGrr);

        total_ap_mem.value = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp ',
        ).format(tApm);

        total_ap_inv.value = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp ',
        ).format(tApi);

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

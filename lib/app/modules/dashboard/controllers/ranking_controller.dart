import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/ranking_month.dart';
import 'package:vis_mobile/app/data/providers/ranking_provider.dart';

class RankingController extends GetxController {
  final RankingProvider rankingProvider;

  RankingController({required this.rankingProvider});

  var isLoading = true.obs;
  final total_row = 0.obs;
  var prev_month = ''.obs;
  var this_year = 0.obs;
  var rankingbfmonth = <RankingMonth>[].obs;
  final total_row_thismonth = 0.obs;
  var this_month = ''.obs;
  var this_year2 = 0.obs;
  var rankingthismonth = <RankingMonth>[].obs;

  @override
  void onInit() {
    fetchRankbfMonth();
    fetchRankthisMonth();
    super.onInit();
  }

  void fetchRankbfMonth() async {
    try {
      final response = await rankingProvider.fetchRankbfMonth();
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        total_row.value = body['total_row'];
        
        var mo = body['prev_month'];
        var m = DateFormat('M').parse('$mo');
        var format = DateFormat('MMMM');
        prev_month.value = format.format(m);
        
        this_year.value = body['this_year'];

        rankingbfmonth.value = body['data'] == null
            ? []
            : listRankingMonthFromJson(jsonEncode(body['data']));

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

  void fetchRankthisMonth() async {
    try {
      final response = await rankingProvider.fetchRankthisMonth();
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        total_row_thismonth.value = body['total_row'];

        var mo = body['this_month'];
        var m = DateFormat('M').parse('$mo');
        var format = DateFormat('MMMM');
        this_month.value = format.format(m);

        this_year2.value = body['this_year'];

        rankingthismonth.value = body['data'] == null
            ? []
            : listRankingMonthFromJson(jsonEncode(body['data']));

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

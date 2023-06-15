import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/data/models/report.dart';
import 'package:vis_mobile/app/data/models/sales_out.dart';
import 'package:vis_mobile/app/data/providers/report_provider.dart';

class ReportController extends GetxController {
  final ReportProvider reportProvider;

  ReportController({required this.reportProvider});

  var isLoading = true.obs;
  final total_row = 0.obs;
  final start_awal = ''.obs;
  final end_awal = ''.obs;
  final start_akhir = ''.obs;
  final end_akhir = ''.obs;
  final total_awal = 0.obs;
  final total_akhir = 0.obs;
  var reportytmonth = <Report>[].obs;

  final total_row_year = 0.obs;
  final start_awal_year = ''.obs;
  final end_awal_year = ''.obs;
  final start_akhir_year = ''.obs;
  final end_akhir_year = ''.obs;
  final total_awal_year = 0.obs;
  final total_akhir_year = 0.obs;
  var reportytdate = <Report>[].obs;

  final total_row_salesout = 0.obs;
  final startdate = TextEditingController();
  final enddate = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var salesout = <SalesOut>[].obs;

  @override
  void onInit() {
    fetchReport();
    fetchReportYear();
    fetchSalesOut();
    super.onInit();
  }

  @override
  void onReady() {
    fetchReport();
    fetchReportYear();
    fetchSalesOut();
    super.onReady();
  }

  @override
  void onClose() {
    reportytdate.close();
    reportytmonth.close();
    salesout.close();
    super.onClose();
  }

  @override
  void dispose() {
    reportytdate.close();
    reportytmonth.close();
    salesout.close();
    super.dispose();
  }

  void fetchReport() async {
    try {
      final response = await reportProvider.fetchReport();
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        total_row.value = body['total_row'];
        start_awal.value = body['start_awal'];
        end_awal.value = body['end_awal'];
        start_akhir.value = body['start_akhir'];
        end_akhir.value = body['end_akhir'];

        reportytmonth.value = body['data'] == null
            ? []
            : listReportFromJson(jsonEncode(body['data']));

        var x = reportytmonth.map((e) => e.col2 as int).toList();
        var akhir = reportytmonth.map((e) => e.col3 as int).toList();

        total_awal.value = x.fold(0, (int sum, int element) => sum + element);
        total_akhir.value =
            akhir.fold(0, (int sum, int element) => sum + element);

        update();
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
    } catch (e) {}

    isLoading.value = false;
    update();
  }

  void fetchReportYear() async {
    try {
      final response = await reportProvider.fetchReportYear();
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print('Success');

        total_row_year.value = body['total_row'];
        start_awal_year.value = body['start_awal'];
        end_awal_year.value = body['end_awal'];
        start_akhir_year.value = body['start_akhir'];
        end_akhir_year.value = body['end_akhir'];

        reportytdate.value = body['data'] == null
            ? []
            : listReportFromJson(jsonEncode(body['data']));

        var awal = reportytdate.map((e) => e.col2 as int).toList();
        var akhir = reportytdate.map((e) => e.col3 as int).toList();

        total_awal_year.value =
            awal.fold(0, (int sum, int element) => sum + element);
        total_akhir_year.value =
            akhir.fold(0, (int sum, int element) => sum + element);

        update();
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
    } catch (e) {}

    isLoading.value = false;
    update();
  }

  void fetchSalesOut() async {
    var data = ({
      'start_date': startdate.text,
      'end_date': enddate.text,
    });

    try {
      final response = await reportProvider.fetchSalesOut(data);
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (body['total_row'] < 1) {
          print('Eweuh');
        } else {
          print('Aya');
        }
        total_row_salesout.value = body['total_row'];
        salesout.value = body['data'] == null
            ? []
            : listSalesOutFromJson(jsonEncode(body['data']));

        update();
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
    } on IOException {
      print('Error');
    }

    isLoading.value = false;
    update();
  }
}

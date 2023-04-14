import 'dart:convert';

import 'package:get/get.dart';
import 'package:vis_mobile/app/data/models/report.dart';
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

  @override
  void onInit() {
    fetchReport();
    fetchReportYear();
    super.onInit();
  }

  @override
  void onReady() {
    fetchReport();
    fetchReportYear();
    super.onReady();
  }

  @override
  void onClose() {
    reportytdate.close();
    reportytmonth.close();
    super.onClose();
  }

  @override
  void dispose() {
    reportytdate.close();
    reportytmonth.close();
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
        end_akhir.value = body['start_akhir'];

        reportytmonth.value = body['data'] == null
            ? []
            : listReportFromJson(jsonEncode(body['data']));

        var x = reportytmonth.map((e) => e.col2 as int).toList();
        var akhir = reportytmonth.map((e) => e.col3 as int).toList();

        total_awal.value = x.fold(0, (int sum, int element) => sum + element);
        total_akhir.value =
            akhir.fold(0, (int sum, int element) => sum + element);

        update();
      } else {
        print('failed');
      }
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
        end_akhir_year.value = body['start_akhir'];

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
      } else {
        print('Fail');
      }
    } catch (e) {}

    isLoading.value = false;
    update();
  }
}

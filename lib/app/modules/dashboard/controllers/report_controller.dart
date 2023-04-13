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
  var reportytmonth = <Report>[].obs;

  @override
  void onInit() {
    fetchReport();
    super.onInit();
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

        update();
      } else {
        print('failed');
      }
    } catch (e) {}

    isLoading.value = false;
    update();
  }
}

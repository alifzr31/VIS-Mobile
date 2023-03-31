import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
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

    masterdatadetail.value = body['data'] == null
        ? []
        : listMasterDataDetailFromJson(jsonEncode(body['data']));
    
    isLoading.value = false;
    update();
  }
}

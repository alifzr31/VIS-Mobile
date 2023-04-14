import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vis_mobile/app/modules/dashboard/controllers/report_controller.dart';
import 'package:vis_mobile/app/widgets/base_button.dart';
import 'package:vis_mobile/app/widgets/base_card.dart';
import 'package:vis_mobile/app/widgets/base_datetimepicker.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

class ReportTab extends StatelessWidget {
  const ReportTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Report Sales Out',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            FormSalesOut(),
            const Divider(),
            Expanded(child: ListSalesOut()),
          ],
        ),
      ),
    );
  }
}

class FormSalesOut extends StatelessWidget {
  FormSalesOut({super.key});
  final controller = Get.find<ReportController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          BaseDateTimePicker(
            controller: controller.startdate,
            type: DateTimePickerType.date,
            label: 'Choose Start Date',
            prefixIcon: const Icon(Icons.event),
            validator: (val) {
              if (val!.isEmpty || val == null) {
                return 'Please Choose Start Date';
              }

              return null;
            },
          ),
          const Divider(),
          BaseDateTimePicker(
            controller: controller.enddate,
            type: DateTimePickerType.date,
            label: 'Choose End Date',
            prefixIcon: const Icon(Icons.event),
            validator: (val) {
              if (val!.isEmpty || val == null) {
                return 'Please Choose End Date';
              }

              return null;
            },
          ),
          const Divider(),
          SizedBox(
            width: Get.width,
            child: BaseButton(
              buttonText: 'Submit',
              onPressed: () async {
                if (controller.formKey.currentState!.validate()) {
                  controller.fetchSalesOut();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListSalesOut extends StatelessWidget {
  ListSalesOut({super.key});
  final controller = Get.find<ReportController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CupertinoActivityIndicator())
          : BaseRefresh(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 3));
                controller.salesout.refresh();
              },
              child: ListView.builder(
                itemCount: controller.salesout.length,
                itemBuilder: (context, index) {
                  final price = NumberFormat.currency(
                    locale: 'id_ID',
                    symbol: 'Rp ',
                  ).format(controller.salesout[index].price);

                  return BaseCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Item Code : ' +
                                  controller.salesout[index].itemcode
                                      .toString(),
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              controller.salesout[index].docdate.toString(),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Text(
                          'Item Name : ' +
                              controller.salesout[index].itemname.toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Quantity : ' +
                              controller.salesout[index].qty.toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Price : ' + price,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}

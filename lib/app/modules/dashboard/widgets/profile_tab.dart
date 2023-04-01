import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vis_mobile/app/modules/dashboard/controllers/user_controller.dart';
import 'package:vis_mobile/app/widgets/base_button.dart';
import 'package:vis_mobile/app/widgets/base_refresh.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: BaseRefresh(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 3));
            setState(() {
              controller.fetchProfile();
            });
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Profile Vendor',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  radius: 90,
                  child: const Icon(FontAwesome.user_large, size: 80),
                ),
                SizedBox(height: Get.height * 0.05),
                SizedBox(width: Get.width, child: bodyItem()),
                SizedBox(height: Get.height * 0.05),
                SizedBox(
                  width: Get.width,
                  child: BaseButton(
                    buttonText: 'Log Out',
                    onPressed: () async {
                      SharedPreferences _prefs =
                          await SharedPreferences.getInstance();
                      await _prefs.clear();
                      Get.offAllNamed('/login');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final controller = Get.find<UserController>();

  Widget bodyItem() {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CupertinoActivityIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  controller.profile.value!.email.toString(),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Address',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  controller.profile.value!.address.toString(),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Tax ID',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  controller.profile.value!.federalTaxId.toString(),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Telephone',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  controller.profile.value!.telephone.toString(),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Telephone 2',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  controller.profile.value!.telephone2.toString(),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Mobile Phone',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  controller.profile.value!.mobilePhone.toString(),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Payment Term',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  controller.profile.value!.paymentTerm.toString(),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Bank Account',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  controller.profile.value!.bankAccount.toString(),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Account Balance',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  controller.ab.value,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Purchase Order',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  controller.po.value,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Goods Receipt PO',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  controller.grpo.value,
                ),
              ],
            ),
    );
  }
}
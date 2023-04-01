import 'package:get/get.dart';
import 'package:vis_mobile/app/modules/dashboard/binding_dashboard.dart';
import 'package:vis_mobile/app/modules/dashboard/view_dashboard.dart';
import 'package:vis_mobile/app/modules/details/master_data/binding_master_data_detail.dart';
import 'package:vis_mobile/app/modules/details/master_data/view_master_data_detail.dart';
import 'package:vis_mobile/app/modules/login/binding_login.dart';
import 'package:vis_mobile/app/modules/login/view_login.dart';
import 'package:vis_mobile/app/modules/purchase_order/binding_po.dart';
import 'package:vis_mobile/app/modules/purchase_order/details/binding_detail_po.dart';
import 'package:vis_mobile/app/modules/purchase_order/details/view_detail_out.dart';
import 'package:vis_mobile/app/modules/purchase_order/details/view_detail_po.dart';
import 'package:vis_mobile/app/modules/purchase_order/view_po.dart';
import 'package:vis_mobile/app/modules/splash/screen_splash.dart';
import 'package:vis_mobile/app/routes/routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.LOGIN,
      binding: LoginBinding(),
      page: () => LoginPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.DASHBOARD,
      binding: DashboardBinding(),
      page: () => DashboardPage(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: Routes.MASTERDATADETAIL,
      binding: MasterDataDetailBinding(),
      page: () => MasterDataDetailPage(),
      transition: Transition.topLevel,
    ),
    GetPage(
      name: Routes.PO,
      binding: PurchaseOrderBinding(),
      page: () => PurchaseOrderPage(),
      transition: Transition.size,
    ),
    GetPage(
      name: Routes.DETAILPO,
      binding: DetailPOBinding(),
      page: () => DetailPOPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.DETAILOUT,
      binding: DetailPOBinding(),
      page: () => DetailOutPage(),
      transition: Transition.fadeIn,
    ),
  ];
}

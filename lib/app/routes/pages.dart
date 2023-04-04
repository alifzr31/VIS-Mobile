import 'package:get/get.dart';
import 'package:vis_mobile/app/modules/dashboard/binding_dashboard.dart';
import 'package:vis_mobile/app/modules/dashboard/view_dashboard.dart';
import 'package:vis_mobile/app/modules/details/master_data/binding_master_data_detail.dart';
import 'package:vis_mobile/app/modules/details/master_data/view_master_data_detail.dart';
import 'package:vis_mobile/app/modules/global/ap-inv/details/binding_detail_apinv.dart';
import 'package:vis_mobile/app/modules/global/ap-inv/details/view_detail_apinv.dart';
import 'package:vis_mobile/app/modules/global/ap-inv/view_apinv.dart';
import 'package:vis_mobile/app/modules/global/ap-mem/binding_apmem.dart';
import 'package:vis_mobile/app/modules/global/ap-mem/details/binding_detail_apmem.dart';
import 'package:vis_mobile/app/modules/global/ap-mem/details/view_detail_apmem.dart';
import 'package:vis_mobile/app/modules/global/ap-mem/view_apmem.dart';
import 'package:vis_mobile/app/modules/global/gr/binding_gr.dart';
import 'package:vis_mobile/app/modules/global/gr/details/binding_detail_gr.dart';
import 'package:vis_mobile/app/modules/global/gr/details/view_detail_gr.dart';
import 'package:vis_mobile/app/modules/global/gr/view_gr.dart';
import 'package:vis_mobile/app/modules/global/grr/binding_grr.dart';
import 'package:vis_mobile/app/modules/global/grr/details/binding_detail_grr.dart';
import 'package:vis_mobile/app/modules/global/grr/details/view_detail_grr.dart';
import 'package:vis_mobile/app/modules/global/grr/view_grr.dart';
import 'package:vis_mobile/app/modules/grpo/binding_grpo.dart';
import 'package:vis_mobile/app/modules/grpo/details/binding_detail_grpo.dart';
import 'package:vis_mobile/app/modules/grpo/details/view_detail_grpo.dart';
import 'package:vis_mobile/app/modules/grpo/view_grpo.dart';
import 'package:vis_mobile/app/modules/login/binding_login.dart';
import 'package:vis_mobile/app/modules/login/view_login.dart';
import 'package:vis_mobile/app/modules/purchase_order/binding_po.dart';
import 'package:vis_mobile/app/modules/global/ap-inv/binding_apinv.dart';
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
    GetPage(
      name: Routes.GRR,
      binding: GrrBinding(),
      page: () => GrrPage(),
      transition: Transition.size,
    ),
    GetPage(
      name: Routes.DETAILGRR,
      binding: DetailGrrBinding(),
      page: () => DetailGrrPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.APINV,
      binding: ApInvBinding(),
      page: () => ApInvPage(),
      transition: Transition.size,
    ),
    GetPage(
      name: Routes.DETAILAPINV,
      binding: DetailApInvBinding(),
      page: () => DetailApInvPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.GRPO,
      binding: GrpoBinding(),
      page: () => GrpoPage(),
      transition: Transition.size,
    ),
    GetPage(
      name: Routes.DETAILGRPO,
      binding: DetailGrpoBinding(),
      page: () => DetailGrpoPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.GR,
      binding: GrBinding(),
      page: () => GrPage(),
      transition: Transition.size,
    ),
    GetPage(
      name: Routes.DETAILGR,
      binding: DetailGrBinding(),
      page: () => DetailGrPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.APMEM,
      binding: ApMemBinding(),
      page: () => ApMemPage(),
      transition: Transition.size,
    ),
    GetPage(
      name: Routes.DETAILAPMEM,
      binding: DetailApMemBinding(),
      page: () => DetailApMemPage(),
      transition: Transition.fadeIn,
    ),
  ];
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vis_mobile/app/modules/dashboard/widgets/home_tab.dart';
import 'package:vis_mobile/app/modules/dashboard/widgets/masterdata_tab.dart';
import 'package:vis_mobile/app/modules/dashboard/widgets/profile_tab.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> bottomNavKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: bottomNavKey,
        color: Colors.black,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.grey,
        height: 55,
        items: [
          NavItem(icon: Icons.home),
          NavItem(icon: Icons.list),
          NavItem(icon: Icons.person),
        ],
        index: _page,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: IndexedStack(
        index: _page,
        children: [
          const HomeTab(),
          const MasterDataTab(),
          const ProfileTab(),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 30,
      color: Colors.white,
    );
  }
}

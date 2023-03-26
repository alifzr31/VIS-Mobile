import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vis_mobile/app/core/value/colors.dart';
import 'package:vis_mobile/app/modules/dashboard/widgets/home_tab.dart';

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
      bottomNavigationBar: CurvedNavigationBar(
        key: bottomNavKey,
        color: blueColor,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.blueAccent.shade100,
        height: 50,
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
          const Center(
            child: Text('List Tab'),
          ),
          const Center(
            child: Text('Account Tab'),
          ),
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
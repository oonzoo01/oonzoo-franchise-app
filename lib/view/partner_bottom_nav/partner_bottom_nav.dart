import 'package:flutter/material.dart';
import 'package:salesapp/utils/language/local_storage.dart';
import 'package:salesapp/view/franchise_onboard_store_screen/franchise_onboard_store_screen.dart';

import '../partner_dashboard/partner_dashboard.dart';
import '../partner_page/partner_page.dart';
import '../total_team_page/total_team_page.dart';

class PartnerBottomNav extends StatefulWidget {
  static String routeName = "/nav";

  final int selectedIndex;

  const PartnerBottomNav({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  State<PartnerBottomNav> createState() => PartnerBottomNavState();
}

class PartnerBottomNavState extends State<PartnerBottomNav> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashBoardPage(),
    FranchiseOnboardStoreScreen(),
    TotalTeamPage(),
    ProfilePage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        selectedLabelStyle:
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home_filled,
              size: 20,
            ),
            activeIcon: const Icon(Icons.home_filled),
            label: tr(context).home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.store,
              size: 20,
            ),
            activeIcon: const Icon(Icons.store),
            label: tr(context).store,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.group,
              size: 20,
            ),
            activeIcon: const Icon(Icons.group),
            label: tr(context).team,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.manage_accounts,
              size: 20,
            ),
            activeIcon: const Icon(Icons.manage_accounts),
            label: tr(context).manage,
          ),
        ],
      ),
    );
  }
}

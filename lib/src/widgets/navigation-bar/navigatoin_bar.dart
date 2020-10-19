import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation(
      {@required this.onSelectTab, this.items, this.selectedIndex});
  final GestureTapCallback onSelectTab;
  final String items;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return FFNavigationBar(
      theme: FFNavigationBarTheme(
        barBackgroundColor: Colors.white,
        selectedItemBorderColor: Colors.yellow,
        selectedItemBackgroundColor: Colors.green,
        selectedItemIconColor: Colors.white,
        selectedItemLabelColor: Colors.black,
      ),
      selectedIndex: selectedIndex,
      onSelectTab: (index) => onSelectTab(),
      items: [
        FFNavigationBarItem(
          iconData: Icons.calendar_today,
          label: 'Schedule',
        ),
        FFNavigationBarItem(
          iconData: Icons.people,
          label: 'Contacts',
        ),
        FFNavigationBarItem(
          iconData: Icons.attach_money,
          label: 'Bills',
        ),
        FFNavigationBarItem(
          iconData: Icons.settings,
          label: 'Settings',
        ),
      ],
    );
  }
}

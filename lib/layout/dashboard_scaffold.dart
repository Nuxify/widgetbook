import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook/navigation/app_bottom_navigation.dart';

/// Note: This widget is provided for reference purposes only.
/// Customize and modify it as needed to suit the specific requirements.
class DashboardScaffold extends StatefulWidget {
  const DashboardScaffold({
    super.key,
  });

  @override
  State<DashboardScaffold> createState() => _DashboardScaffoldState();
}

class _DashboardScaffoldState extends State<DashboardScaffold> {
  int activeIndex = 0;

  late final List<BottomNavigationItem> bottomNavItems = <BottomNavigationItem>[
    BottomNavigationItem(
      onTap: () {
        setState(() {
          activeIndex = 0;
        });
      },
      label: 'Home',
      icon: Icons.home,
    ),
    BottomNavigationItem(
      onTap: () {
        setState(() {
          activeIndex = 1;
        });
      },
      label: 'Chats',
      icon: Icons.chat,
    ),
    BottomNavigationItem(
      onTap: () {
        setState(() {
          activeIndex = 2;
        });
      },
      label: 'Rewards',
      icon: Icons.golf_course_sharp,
    ),
    BottomNavigationItem(
      onTap: () {
        setState(() {
          activeIndex = 3;
        });
      },
      label: 'Cart',
      icon: Icons.shopping_basket,
    ),
    BottomNavigationItem(
      onTap: () {
        setState(() {
          activeIndex = 4;
        });
      },
      label: 'Profile',
      icon: Icons.person_4_rounded,
    ),
    BottomNavigationItem(
      onTap: () {
        setState(() {
          activeIndex = 5;
        });
      },
      label: 'Menu',
      icon: Icons.menu,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemBuilder: (context, index) => Text('Sample #$index'),
            ),
            AppBottomNavigation(
              activeIndex: activeIndex,
              items: bottomNavItems,
              isFloatingBottomNavBar: true,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook/gen/assets.gen.dart';
import 'package:nuxify_widgetbook/views/app_bottom_navigation.dart';

class DashboardScaffold extends StatefulWidget {
  /// A custom scaffold widget designed to provide a flexible layout for dashboard screens. It supports a floating bottom navigation bar and a customizable body.
  ///
  /// [body] A required widget that represents the main content of the scaffold. This will be displayed in the primary area of the scaffold.
  ///
  /// [isFloatingBottomNavBar] A boolean that determines whether the bottom navigation bar should float above the body content. Default is true.
  const DashboardScaffold({
    required this.body,
    this.isFloatingBottomNavBar = true,
    super.key,
  });
  final bool isFloatingBottomNavBar;
  final Widget body;

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
      icon: Assets.icons.menu,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.body,
      ),
      floatingActionButtonLocation: widget.isFloatingBottomNavBar
          ? FloatingActionButtonLocation.centerDocked
          : null,
      floatingActionButton: widget.isFloatingBottomNavBar
          ? AppBottomNavigation(
              activeIndex: activeIndex,
              items: bottomNavItems,
              isFloatingBottomNavBar: widget.isFloatingBottomNavBar,
            )
          : null,
      bottomNavigationBar: widget.isFloatingBottomNavBar
          ? null
          : AppBottomNavigation(
              activeIndex: activeIndex,
              items: bottomNavItems,
              isFloatingBottomNavBar: widget.isFloatingBottomNavBar,
            ),
    );
  }
}

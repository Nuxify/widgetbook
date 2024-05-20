import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook/navigation/app_bottom_navigation.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: AppBottomNavigation)
Widget defaultUseCase(BuildContext context) {
  return const Align(
    alignment: Alignment.bottomCenter,
    child: _BottomNavigation(),
  );
}

class _BottomNavigation extends StatefulWidget {
  const _BottomNavigation();

  @override
  State<_BottomNavigation> createState() => __BottomNavigationState();
}

class __BottomNavigationState extends State<_BottomNavigation> {
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
              activeColor: context.knobs.color(
                label: 'Active Color',
                initialValue: Colors.green,
              ),
              inactiveColor: context.knobs.color(
                label: 'Inactive Color',
                initialValue: Colors.black54,
              ),
              containerColor: context.knobs.color(
                label: 'Container Color',
              ),
              iconSize: context.knobs.double.slider(
                label: 'Icon Size',
                initialValue: 20,
                max: 30,
                min: 20,
              ),
              items: bottomNavItems.sublist(
                0,
                context.knobs.int.slider(
                  label: 'Bottom Nav Items.',
                  initialValue: 6,
                  max: 6,
                  min: 1,
                ),
              ),
              isFloatingBottomNavBar: context.knobs.boolean(
                label: 'Floating Navigation Bar.',
                initialValue: true,
              ),
              yPosition: context.knobs.double.slider(
                label: 'Y Position',
                initialValue: 0.95,
                max: 1,
                min: 0.6,
              ),
            )
          ],
        ),
      ),
    );
  }
}

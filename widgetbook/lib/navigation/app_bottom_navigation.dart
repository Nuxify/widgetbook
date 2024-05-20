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

  // late List<BottomNavigationItem> bottomNavItems = ;

  @override
  Widget build(BuildContext context) {
    final Color activeColor = context.knobs.color(
      label: 'Active Color',
      initialValue: Colors.green,
    );
    final Color inactiveColor = context.knobs.color(
      label: 'Inactive Color',
      initialValue: Colors.black54,
    );
    final double fontSize = context.knobs.double
        .slider(label: 'Font Size', initialValue: 11, min: 9, max: 15);
    final double iconSize = context.knobs.double
        .slider(label: 'Icon Size', initialValue: 20, min: 18, max: 30);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemBuilder: (context, index) => Text('Sample #$index'),
            ),
            AppBottomNavigation(
              activeIndex: activeIndex,
              containerColor: context.knobs.color(
                label: 'Container Color',
              ),
              items: <BottomNavigationItem>[
                BottomNavigationItem(
                  onTap: () {
                    setState(() {
                      activeIndex = 0;
                    });
                  },
                  label: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: fontSize,
                      color: activeIndex == 0 ? activeColor : inactiveColor,
                    ),
                  ),
                  icon: Icon(
                    Icons.home,
                    size: iconSize,
                    color: activeIndex == 0 ? activeColor : inactiveColor,
                  ),
                ),
                BottomNavigationItem(
                  onTap: () {
                    setState(() {
                      activeIndex = 1;
                    });
                  },
                  label: Text(
                    'Chats',
                    style: TextStyle(
                      fontSize: fontSize,
                      color: activeIndex == 1 ? activeColor : inactiveColor,
                    ),
                  ),
                  icon: Icon(
                    Icons.chat,
                    size: iconSize,
                    color: activeIndex == 1 ? activeColor : inactiveColor,
                  ),
                ),
                BottomNavigationItem(
                  onTap: () {
                    setState(() {
                      activeIndex = 2;
                    });
                  },
                  label: Text(
                    'Rewards',
                    style: TextStyle(
                      fontSize: fontSize,
                      color: activeIndex == 2 ? activeColor : inactiveColor,
                    ),
                  ),
                  icon: Icon(
                    Icons.golf_course_sharp,
                    size: iconSize,
                    color: activeIndex == 2 ? activeColor : inactiveColor,
                  ),
                ),
                BottomNavigationItem(
                  onTap: () {
                    setState(() {
                      activeIndex = 3;
                    });
                  },
                  label: Text(
                    'Cart',
                    style: TextStyle(
                      fontSize: fontSize,
                      color: activeIndex == 3 ? activeColor : inactiveColor,
                    ),
                  ),
                  icon: Icon(
                    Icons.shopping_basket,
                    size: iconSize,
                    color: activeIndex == 3 ? activeColor : inactiveColor,
                  ),
                ),
                BottomNavigationItem(
                  onTap: () {
                    setState(() {
                      activeIndex = 4;
                    });
                  },
                  label: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: fontSize,
                      color: activeIndex == 4 ? activeColor : inactiveColor,
                    ),
                  ),
                  icon: Icon(
                    Icons.person_4_rounded,
                    size: iconSize,
                    color: activeIndex == 4 ? activeColor : inactiveColor,
                  ),
                ),
                BottomNavigationItem(
                  onTap: () {
                    setState(() {
                      activeIndex = 5;
                    });
                  },
                  label: Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: fontSize,
                      color: activeIndex == 5 ? activeColor : inactiveColor,
                    ),
                  ),
                  icon: Icon(
                    Icons.menu,
                    size: iconSize,
                    color: activeIndex == 5 ? activeColor : inactiveColor,
                  ),
                ),
              ].sublist(
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

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
  final Color activeColor = Colors.green;
  final Color inactiveColor = Colors.black54;

  int activeIndex = 0;

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
                      fontSize: 11,
                      color: activeIndex == 0 ? activeColor : inactiveColor,
                    ),
                  ),
                  icon: Icon(
                    Icons.home,
                    size: 20,
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
                      fontSize: 11,
                      color: activeIndex == 1 ? activeColor : inactiveColor,
                    ),
                  ),
                  icon: Icon(
                    Icons.chat,
                    size: 20,
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
                      fontSize: 11,
                      color: activeIndex == 2 ? activeColor : inactiveColor,
                    ),
                  ),
                  icon: Icon(
                    Icons.golf_course_sharp,
                    size: 20,
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
                      fontSize: 11,
                      color: activeIndex == 3 ? activeColor : inactiveColor,
                    ),
                  ),
                  icon: Icon(
                    Icons.shopping_basket,
                    size: 20,
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
                      fontSize: 11,
                      color: activeIndex == 4 ? activeColor : inactiveColor,
                    ),
                  ),
                  icon: Icon(
                    Icons.person_4_rounded,
                    size: 20,
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
                      fontSize: 11,
                      color: activeIndex == 5 ? activeColor : inactiveColor,
                    ),
                  ),
                  icon: Icon(
                    Icons.menu,
                    size: 20,
                    color: activeIndex == 5 ? activeColor : inactiveColor,
                  ),
                ),
              ],
              isFloatingBottomNavBar: true,
            )
          ],
        ),
      ),
    );
  }
}

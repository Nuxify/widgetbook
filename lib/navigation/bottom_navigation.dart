import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    required this.activeIndex,
    required this.items,
    this.borderRadius = 20,
    this.activeColor,
    this.inactiveColor = Colors.black45,
    super.key,
  });
  final List<BottomNavItem> items;
  final int activeIndex;
  final double borderRadius;
  final Color? activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * .88,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0xFFF1F1F1),
            spreadRadius: 4,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          for (int i = 0; i < items.length; i++)
            IconButton(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: items[i].icon,
                  ),
                  Text(
                    items[i].label,
                    style: TextStyle(
                      // fontSize: 11,
                      color: activeIndex == i
                          ? activeColor ?? Theme.of(context).primaryColor
                          : inactiveColor,
                    ),
                  ),
                ],
              ),
              onPressed: () => items[i].onTap(),
            ),
        ],
      ),
    );
  }
}

class BottomNavItem {
  BottomNavItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Widget icon;
  final String label;
  final Function() onTap;
}

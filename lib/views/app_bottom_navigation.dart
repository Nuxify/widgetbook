import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook/gen/assets.gen.dart';

class BottomNavigationItem {
  BottomNavigationItem({
    required this.onTap,
    required this.label,
    required this.icon,
  });

  final VoidCallback onTap;
  final String label;
  final dynamic icon;

  bool get isIconData => icon is IconData;
}

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({
    required this.isFloatingBottomNavBar,
    required this.activeIndex,
    required this.items,
    this.bottomMargin = 15,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.black54,
    this.textStyle,
    this.containerColor,
    this.iconSize,
    super.key,
  }) : assert(!(items.length > 6), 'Max items should only be 6');
  final int activeIndex;
  final double bottomMargin;
  final List<BottomNavigationItem> items;
  final Color activeColor;
  final Color inactiveColor;
  final Color? containerColor;
  final TextStyle? textStyle;
  final double? iconSize;
  final bool isFloatingBottomNavBar;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      constraints: BoxConstraints(
        maxWidth: width * .88,
      ),
      margin: EdgeInsets.only(bottom: bottomMargin),
      decoration: BoxDecoration(
        borderRadius: !isFloatingBottomNavBar
            ? const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              )
            : BorderRadius.circular(20),
        color: containerColor ?? Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0xFFF1F1F1),
            spreadRadius: 4,
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          for (int i = 0; i < items.length; i++)
            Flexible(
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: items[i].isIconData
                          ? Icon(
                              items[i].icon,
                              size: iconSize ?? 20,
                              color: activeIndex == i
                                  ? activeColor
                                  : inactiveColor,
                            )
                          : (items[i].icon as SvgGenImage).svg(
                              width: iconSize ?? 20,
                              colorFilter: ColorFilter.mode(
                                activeIndex == i ? activeColor : inactiveColor,
                                BlendMode.srcIn,
                              )),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        items[i].label,
                        style: textStyle ??
                            TextStyle(
                              fontSize: 11,
                              color: activeIndex == i
                                  ? activeColor
                                  : inactiveColor,
                            ),
                      ),
                    ),
                  ],
                ),
                onPressed: items[i].onTap,
              ),
            )
        ],
      ),
    );
  }
}

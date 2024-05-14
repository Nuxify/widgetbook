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
  /// A custom bottom navigation widget designed to support up to 6 items, with the option for a floating style. This widget is highly customizable, allowing you to define the active item, colors, text styles, icon sizes, and more.
  ///
  /// [isFloatingBottomNavBar] A boolean to determine if the bottom navigation bar should be floating.
  ///
  /// [activeIndex] The index of the currently active navigation item.
  ///
  /// [items] A list of BottomNavigationItem objects representing the items to be displayed in the bottom navigation bar. The maximum number of items is 6.
  ///
  /// [yPosition] Only for floating nav bar: The position of floating nav bar.
  ///
  /// [activeColor] The color used for the active item. Default is Colors.green.
  ///
  /// [inactiveColor] The color used for inactive items. Default is Colors.black54.
  ///
  /// [textStyle] An optional text style for the labels of the navigation items.
  ///
  /// [containerColor] An optional background color for the navigation bar container.
  ///
  /// [iconSize] An optional size for the icons in the navigation items.
  const AppBottomNavigation({
    required this.isFloatingBottomNavBar,
    required this.activeIndex,
    required this.items,
    this.yPosition = 0.95,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.black54,
    this.textStyle,
    this.containerColor,
    this.iconSize,
    super.key,
  }) : assert(!(items.length > 6), 'Max items should only be 6');
  final int activeIndex;
  final double yPosition;
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

    return Align(
      alignment: Alignment(0, isFloatingBottomNavBar ? yPosition : 1),
      child: Container(
        width: width,
        constraints: BoxConstraints(
          maxWidth: isFloatingBottomNavBar ? width * 0.88 : width,
        ),
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
                                  activeIndex == i
                                      ? activeColor
                                      : inactiveColor,
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
      ),
    );
  }
}

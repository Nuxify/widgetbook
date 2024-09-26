import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook/indicators/chip.dart';

class ChipsSelection extends StatelessWidget {
  /// A row of selectable chips. It takes a list of items and a list of active indexes as input.
  ///
  /// Will become scrollable if the items exceed the bounds of the screen.
  ///
  /// [items] A list of strings representing the items to be displayed as chips.
  ///
  /// [activeIndexes] A list of integers representing the indexes of the active chips.
  ///
  /// [activeColor] The color of the active chips. If not provided, it uses the primary color from the current theme.
  ///
  /// [inactiveColor] The color of the inactive chips. If not provided, it's a slightly transparent version of the primary color from the current theme.
  ///
  /// [activeTextStyle] The text style for the active chips.
  ///
  /// [inactiveTextStyle] The text style for the inactive chips.
  ///
  /// [onTap] A callback function that is called when a chip is tapped. It takes the index of the tapped chip as a parameter.
  ///
  /// [spacing] The spacing between the chips in the row. Default value is 2.
  const ChipsSelection({
    required this.items,
    required this.activeIndexes,
    this.activeColor,
    this.inactiveColor,
    this.activeTextStyle,
    this.inactiveTextStyle,
    this.onTap,
    this.spacing = 2,
    super.key,
  });
  final List<String> items;
  final List<int> activeIndexes;
  final Color? activeColor;
  final Color? inactiveColor;
  final TextStyle? activeTextStyle;
  final TextStyle? inactiveTextStyle;
  final void Function(int index)? onTap;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < items.length; i++)
            Padding(
              padding: EdgeInsets.only(right: spacing),
              child: ChipIndicator(
                onTap: () => onTap?.call(i),
                backgroundColor: activeIndexes.contains(i)
                    ? activeColor ?? Theme.of(context).primaryColor
                    : inactiveColor ??
                        Theme.of(context).primaryColor.withOpacity(0.1),
                child: Text(
                  items[i],
                  style: activeIndexes.contains(i)
                      ? activeTextStyle
                      : inactiveTextStyle,
                ),
              ),
            )
        ],
      ),
    );
  }
}

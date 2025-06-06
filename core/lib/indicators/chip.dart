import 'package:flutter/material.dart';

class ChipIndicator extends StatelessWidget {
  /// A chip widget with an optional background color, padding, and child widget.
  ///
  /// [child] The widget that will be displayed inside the chip.
  ///
  /// [onTap] An optional callback function that will be called when the chip is tapped.
  ///
  /// [backgroundColor] The background color of the chip. If not provided, it will default to a slightly transparent version of the theme's primary color.
  ///
  /// [padding] The padding around the child widget. It defaults to EdgeInsets.symmetric(horizontal: 15, vertical: 4).
  ///
  /// [borderColor] Provide optional border color for the chip
  const ChipIndicator({
    required this.child,
    this.onTap,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
    this.borderColor,
    super.key,
  });
  final Widget child;
  final void Function()? onTap;
  final Color? backgroundColor;
  final EdgeInsetsGeometry padding;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: backgroundColor ??
              Theme.of(context).primaryColor.withValues(alpha: 0.1),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}

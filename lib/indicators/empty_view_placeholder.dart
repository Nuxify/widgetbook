import 'package:flutter/material.dart';

class EmptyViewPlaceholder extends StatelessWidget {
  /// A widget that displays a graphic and a label when there are no items to display.
  ///
  /// The build method calculates the width of the widget based on the available space and returns a Column widget
  /// with the graphic and label centered vertically and horizontally.
  ///
  /// The [graphic] and [label] are passed in as constructor parameters, and the height of the widget can be customized.
  const EmptyViewPlaceholder({
    required this.graphic,
    required this.label,
    this.height = 200,
    super.key,
  });
  final Widget graphic;
  final Widget label;
  final double height;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [graphic, label],
      ),
    );
  }
}

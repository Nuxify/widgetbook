import 'package:flutter/material.dart';

class AppBottomsheet extends StatelessWidget {
  /// A custom bottom sheet widget for displaying content with optional title, leading, and trailing widgets.
  ///
  /// [body] The main content of the bottom sheet.
  ///
  /// [isExpanded] A boolean value indicating whether the body should be expanded to fill the available space vertically. If true, the body will be wrapped in an Expanded widget.
  ///
  /// [title] A widget to display as the title of the bottom sheet. Displays at the center of the header.
  ///
  /// [leading] A widget to display at the start of the title row.
  ///
  /// [trailing] A widget to display at the end of the title row.
  const AppBottomsheet({
    required this.body,
    required this.isExpanded,
    this.title,
    this.leading,
    this.trailing,
    super.key,
  });
  final Widget body;
  final Widget? title;
  final Widget? leading;
  final Widget? trailing;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              leading ?? const SizedBox.shrink(),
              title ?? const SizedBox.shrink(),
              trailing ?? const SizedBox.shrink(),
            ],
          ),
          if (isExpanded) Expanded(child: body) else body,
        ],
      ),
    );
  }
}

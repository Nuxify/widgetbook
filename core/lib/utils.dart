import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook_core/views/bottomsheet.dart';

// Opens a bottom sheet with the provided body, title, leading, and trailing widgets.
void openBottomSheet(
  BuildContext context, {
  required Widget body,
  bool isExpanded = false,
  Widget? title,
  Widget? leading,
  Widget? trailing,
}) {
  showModalBottomSheet<dynamic>(
    context: context,
    useSafeArea: true,
    enableDrag: false,
    scrollControlDisabledMaxHeightRatio: isExpanded ? 0.97 : 0.5,
    builder: (_) => AppBottomsheet(
      body: body,
      title: title,
      leading: leading,
      trailing: trailing,
      isExpanded: isExpanded,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook/indicators/chips_selection.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: ChipsSelection)
Widget defaultUseCase(BuildContext context) {
  final int itemCount =
      context.knobs.int.slider(label: 'Chip Count', initialValue: 3);

  return Center(
    child: ChipsSelection(
      items: [for (int j = 0; j < itemCount; j++) 'Item $j'],
      activeIndexes: const [0, 1, 2],
    ),
  );
}

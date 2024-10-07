import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook_core/indicators/chips_selection.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: ChipsSelection)
Widget defaultUseCase(BuildContext context) {
  final int itemCount =
      context.knobs.int.slider(label: 'Chip Count', initialValue: 3, max: 20);

  return Center(
    child: ChipsSelection(
      items: [for (int j = 0; j < itemCount; j++) 'Item $j'],
      activeIndexes: List.generate(
          context.knobs.int.slider(
            label: 'Active Indexes',
            initialValue: 1,
            max: 20,
            min: 1,
          ),
          (index) => index),
      spacing: context.knobs.double.slider(label: 'Spacing', initialValue: 5),
      activeColor: context.knobs.color(
        label: 'Active Color',
        initialValue: Colors.green,
      ),
      activeBorderColor: context.knobs.color(
        label: 'Active Border Color',
        initialValue: Colors.transparent,
      ),
      inactiveBorderColor: context.knobs.color(
        label: 'Inctive Border Color',
        initialValue: Colors.transparent,
      ),
      inactiveColor: context.knobs.color(
        label: 'Inctive Color',
        initialValue: Colors.grey,
      ),
      activeTextStyle: TextStyle(
          color: context.knobs.color(
            label: 'Active Font Color',
            initialValue: Colors.white,
          ),
          fontWeight: FontWeight.w500),
      inactiveTextStyle: TextStyle(
          color: context.knobs.color(
            label: 'Active Font Color',
            initialValue: Colors.white,
          ),
          fontWeight: FontWeight.w500),
    ),
  );
}

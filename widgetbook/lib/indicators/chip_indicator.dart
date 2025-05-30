import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook_core/indicators/chip.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: ChipIndicator)
Widget defaultUseCase(BuildContext context) {
  return Center(
    child: ChipIndicator(
      onTap: context.knobs.boolean(label: 'Is tappable') ? () {} : null,
      backgroundColor: context.knobs.color(
        label: 'Color',
        initialValue: Theme.of(context).primaryColor,
      ),
      borderColor: context.knobs.color(
        label: 'Border Color',
        initialValue: Colors.transparent,
      ),
      padding: EdgeInsets.fromLTRB(
        context.knobs.double.slider(
          label: 'Left Padding',
          initialValue: 15,
        ),
        context.knobs.double.slider(
          label: 'Top Padding',
          initialValue: 4,
        ),
        context.knobs.double.slider(
          label: 'Right Padding',
          initialValue: 15,
        ),
        context.knobs.double.slider(
          label: 'Bottom Padding',
          initialValue: 4,
        ),
      ),
      child: Text(
        context.knobs.string(
          label: 'Label',
          initialValue: 'New',
        ),
        style: TextStyle(
          color: context.knobs.color(label: 'Text Color'),
        ),
      ),
    ),
  );
}

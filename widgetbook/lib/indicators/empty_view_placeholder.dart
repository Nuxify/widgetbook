import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook_core/indicators/empty_view_placeholder.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: EmptyViewPlaceholder)
Widget defaultUseCase(BuildContext context) {
  return Center(
    child: EmptyViewPlaceholder(
      height: context.knobs.double.slider(
        label: 'Empty View PlaceHolder Height',
        initialValue: 250,
        max: 400,
        min: 250,
      ),
      graphic: Icon(
        Icons.broken_image,
        color: context.knobs.color(label: 'Graphic Color'),
        size: context.knobs.double.slider(
          label: 'Graphic size',
          initialValue: 50,
          max: 150,
          min: 50,
        ),
      ),
      label: Text(
        context.knobs.string(
          label: 'Label',
          initialValue: 'Missing record.',
        ),
        style: TextStyle(
          color: context.knobs.color(label: 'Text Color'),
          fontSize: context.knobs.double.slider(
            label: 'Label size',
            initialValue: 12,
            max: 50,
            min: 10,
          ),
        ),
      ),
    ),
  );
}

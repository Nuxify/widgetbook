import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook/input/filled_textfield.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: FilledTextField)
Widget defaultUseCase(BuildContext context) {
  final double width = MediaQuery.of(context).size.width;
  final TextEditingController textEditingController = TextEditingController();
  return Container(
    width: double.infinity,
    alignment: Alignment.center,
    child: SizedBox(
      width: context.knobs.double.slider(
        label: 'Text Field Size',
        initialValue: width * 0.5,
        max: width,
        min: width * 0.1,
      ),
      child: Center(
        child: FilledTextField(
          controller: textEditingController,
          isDense: context.knobs.boolean(label: 'TextField isDense'),
          obscureText: context.knobs.boolean(label: 'TextField obscureText'),
          fillColor: context.knobs.color(label: 'Fill Color'),
          borderRadius: context.knobs.double.slider(
              label: 'Border Radius', initialValue: 30, max: 50, min: 1),
          contentPadding: EdgeInsets.symmetric(
            vertical: context.knobs.double.slider(
                label: 'Content Padding Vertical',
                initialValue: 10,
                max: 50,
                min: 1),
            horizontal: context.knobs.double.slider(
                label: 'Content Padding Horizontal',
                initialValue: 20,
                max: 50,
                min: 1),
          ),
          floatingLabelBehavior: context.knobs.list(
            label: 'Floating Label Behavior',
            options: <FloatingLabelBehavior>[
              FloatingLabelBehavior.always,
              FloatingLabelBehavior.auto,
              FloatingLabelBehavior.never,
            ],
          ),
          labelText: context.knobs.string(label: 'Label Text'),
          prefix: context.knobs.boolean(label: 'Display Suffix Widget')
              ? const Icon(Icons.search)
              : null,
          suffix: context.knobs.boolean(label: 'Display Prefix Widget')
              ? const Icon(Icons.date_range)
              : null,
        ),
      ),
    ),
  );
}

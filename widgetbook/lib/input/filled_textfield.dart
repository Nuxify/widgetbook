import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook_core/input/filled_textfield.dart';
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
      child: Form(
        key: GlobalKey<FormState>(),
        child: Center(
          child: FilledTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            controller: textEditingController,
            isDense: context.knobs.boolean(label: 'TextField isDense'),
            obscureText: context.knobs.boolean(label: 'TextField obscureText'),
            fillColor: context.knobs.color(label: 'Fill Color'),
            enabled:
                context.knobs.boolean(label: 'Enabled', initialValue: true),
            borderRadius: context.knobs.double.slider(
                label: 'Border Radius', initialValue: 30, max: 50, min: 1),
            contentPadding: EdgeInsets.symmetric(
              vertical: context.knobs.double.slider(
                  label: 'Content Padding Vertical',
                  initialValue: 10,
                  max: 50,
                  min: 1),
              horizontal: 20,
            ),
            floatingLabelBehavior: context.knobs.list(
              label: 'Floating Label Behavior',
              options: <FloatingLabelBehavior>[
                FloatingLabelBehavior.always,
                FloatingLabelBehavior.auto,
                FloatingLabelBehavior.never,
              ],
            ),
            autovalidateMode: context.knobs.list(
              label: 'Auto validate Mode',
              options: <AutovalidateMode>[
                AutovalidateMode.always,
                AutovalidateMode.onUserInteraction,
                AutovalidateMode.disabled,
              ],
              initialOption: AutovalidateMode.disabled,
            ),
            hintText: context.knobs
                .string(label: 'Hint Text', initialValue: 'Input here'),
            prefix: context.knobs.boolean(label: 'Display Suffix Widget')
                ? const Icon(Icons.search)
                : null,
            suffix: context.knobs.boolean(label: 'Display Prefix Widget')
                ? const Icon(Icons.date_range)
                : null,
          ),
        ),
      ),
    ),
  );
}

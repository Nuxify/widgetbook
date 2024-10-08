import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook_core/input/outlined_textfield.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: OutlinedTextField)
Widget defaultUseCase(BuildContext context) {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              OutlinedTextField(
                enabled:
                    context.knobs.boolean(label: 'Enabled', initialValue: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
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
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                ),
                borderColor: context.knobs.color(label: 'Border Color'),
                errorBorderColor:
                    context.knobs.color(label: 'Error Border Color'),
                focusedBorderColor:
                    context.knobs.color(label: 'Focused Border Color'),
                controller: textEditingController,
                isDense: context.knobs.boolean(label: 'TextField isDense'),
                textStyle: TextStyle(
                  color: context.knobs.color(label: 'Text Input Color'),
                ),
                obscureText:
                    context.knobs.boolean(label: 'TextField obscureText'),
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
                prefix: context.knobs.boolean(label: 'Display Suffix Widget')
                    ? const Icon(
                        Icons.search,
                        color: Colors.grey,
                      )
                    : null,
                suffix: context.knobs.boolean(label: 'Display Prefix Widget')
                    ? const Icon(
                        Icons.date_range,
                        color: Colors.grey,
                      )
                    : null,
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                child: ElevatedButton(
                  onPressed: () => formKey.currentState!.validate(),
                  child: const Text('Trigger Error'),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

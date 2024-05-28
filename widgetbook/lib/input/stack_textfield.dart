import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook/input/stack_textfield.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: StackTextField)
Widget defaultUseCase(BuildContext context) {
  final double width = MediaQuery.of(context).size.width;

  return Center(
    child: SizedBox(width: width * 0.5, child: const _StackTextField()),
  );
}

class _StackTextField extends StatefulWidget {
  const _StackTextField();

  @override
  State<_StackTextField> createState() => __StackTextFieldState();
}

class __StackTextFieldState extends State<_StackTextField> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final String label =
        context.knobs.string(label: 'Label', initialValue: 'Label here');
    return StackTextField(
      controller: textEditingController,
      hintText: label,
      label: label,
      readOnly: context.knobs.boolean(label: 'Read only', initialValue: false),
      enabled:
          context.knobs.boolean(label: 'Enabled TextField', initialValue: true),
      maxLines: context.knobs.int.slider(
        label: 'Max Lines',
        initialValue: 1,
        max: 10,
        min: 1,
      ),
      suffixIcon: context.knobs
              .boolean(label: 'Display Suffix Icon', initialValue: false)
          ? const Icon(Icons.search)
          : null,
      prefixIcon: context.knobs
              .boolean(label: 'Display Prefix Icon', initialValue: false)
          ? const Icon(Icons.person)
          : null,
      isDense: context.knobs.boolean(label: 'Is Dense', initialValue: false),
      labelColor:
          context.knobs.color(label: 'Label Color', initialValue: Colors.black),
      fillColor:
          context.knobs.color(label: 'Fill Color', initialValue: Colors.white),
      style: TextStyle(
        color: context.knobs
            .color(label: 'Text Color', initialValue: Colors.black),
      ),
    );
  }
}

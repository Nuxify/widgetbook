import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook_core/indicators/horizontal_stepper.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: HorizontalStepper)
Widget defaultUseCase(BuildContext context) {
  const int maxStep = 10;
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: HorizontalStepper(
        length: context.knobs.int.slider(
          label: 'Horizontal Length',
          initialValue: 3,
          max: maxStep,
        ),
        currentStep: context.knobs.int.slider(
          label: 'Current Step',
          initialValue: 1,
          min: 1,
          max: maxStep,
        ),
        inactiveColor: context.knobs.color(
          label: 'Inactive Color',
          initialValue: Colors.grey,
        ),
        activeColor: context.knobs.color(
          label: 'Active Color',
          initialValue: Theme.of(context).primaryColor,
        ),
        stepPadding:
            context.knobs.double.input(label: 'Step Padding', initialValue: 8),
        indicatorThickness: context.knobs.double.input(
          label: 'Indicator Thickness',
          initialValue: 2,
        ),
        borderRadius: context.knobs.double.input(
          label: 'Border Radius',
          initialValue: 2,
        ),
      ),
    ),
  );
}

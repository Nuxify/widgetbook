import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook/views/alert_dialog.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/test/main_test.dart';
import 'package:widgetbook_workspace/test/observer_tester.dart';

@widgetbook.UseCase(name: 'Default', type: AppAlertDialog)
Widget defaultUseCase(BuildContext context) {
  return universalPumper(
    Center(
      child: AppAlertDialog(
        title:
            context.knobs.string(label: 'Title', initialValue: 'Hello there!'),
        bodyText: context.knobs.string(
          label: 'Body Text',
          initialValue:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam a vehicula nunc. Vestibulum tincidunt, urna quis vestibulum viverra, nunc ex interdum libero, ac laoreet metus dolor eu massa. Curabitur et dignissim dui. ',
        ),
        hasCancelButton: context.knobs.boolean(
          label: 'Has cancel button',
          initialValue: true,
        ),
        actionButton: context.knobs
                .boolean(label: 'Show Action Button', initialValue: true)
            ? TextButton(
                onPressed: () {},
                child: const Text(
                  'Confirm',
                  style: TextStyle(color: Color(0xFF8D9297)),
                ),
              )
            : const SizedBox.shrink(),
      ),
    ),
    observer: TestObserver(),
  );
}

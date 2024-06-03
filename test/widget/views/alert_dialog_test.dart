import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuxify_widgetbook/test/main_test.dart';
import 'package:nuxify_widgetbook/views/alert_dialog.dart';

void main() {
  Future<void> widgetPumper(
    WidgetTester tester, {
    bool hasCancelButton = true,
    void Function()? onPressed,
  }) async =>
      tester.pumpWidget(
        universalPumper(
          Scaffold(
            body: Builder(
              builder: (context) => Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AppAlertDialog(
                        title: 'Test Title',
                        bodyText: 'Test body text',
                        actionButton: TextButton(
                          onPressed: onPressed,
                          child: const Text('OK'),
                        ),
                        hasCancelButton: hasCancelButton,
                      ),
                    );
                  },
                  child: const Text('Show Dialog'),
                ),
              ),
            ),
          ),
        ),
      );
  group('Alert Dialog.', () {
    testWidgets('Displays title, body text, and action button correctly',
        (WidgetTester tester) async {
      await widgetPumper(tester);
      await tester.pump();

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test body text'), findsOneWidget);
      expect(find.text('OK'), findsOneWidget);
    });

    // Cancel Button Visibility Test
    testWidgets('Cancel button visibility based on hasCancelButton flag',
        (WidgetTester tester) async {
      await widgetPumper(tester, hasCancelButton: false);
      await tester.pump();

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.text('Cancel'), findsNothing);
      expect(find.text('OK'), findsOneWidget);
    });

    // Action Button Functionality Test
    testWidgets('Action button triggers correct action',
        (WidgetTester tester) async {
      var actionButtonTapped = false;

      await widgetPumper(
        tester,
        hasCancelButton: false,
        onPressed: () {
          actionButtonTapped = true;
        },
      );
      await tester.pump();

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(actionButtonTapped, isTrue);
    });

    // Cancel Button Functionality Test
    testWidgets('Cancel button dismisses the dialog',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AppAlertDialog(
                        title: 'Test Title',
                        bodyText: 'Test body text',
                        actionButton: TextButton(
                          onPressed: () {},
                          child: const Text('OK'),
                        ),
                      ),
                    );
                  },
                  child: const Text('Show Dialog'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(
          find.text('Test Title'), findsNothing); // Dialog should be dismissed
    });
  });
}

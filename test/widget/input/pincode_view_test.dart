import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuxify_widgetbook/input/pincode_view.dart';
import 'package:nuxify_widgetbook/test/main_test.dart';

void main() {
  group('Pincode View.', () {
    Future<void> widgetPumper(
      WidgetTester tester, {
      required int length,
      required void Function(String) onComplete,
      TextStyle? keypadTextStyle,
      Color indicatorColor = const Color(0xFF161D4B),
      Color indicatorInactiveColor = const Color(0xFFEDEDED),
      Widget? label,
      Widget? logo,
    }) async =>
        tester.pumpWidget(
          universalPumper(
            Scaffold(
              body: Column(
                children: [
                  PincodeView(
                    length: length,
                    onComplete: onComplete,
                    keypadTextStyle: keypadTextStyle,
                    indicatorColor: indicatorColor,
                    indicatorInactiveColor: indicatorInactiveColor,
                    label: label,
                    logo: logo,
                  ),
                ],
              ),
            ),
          ),
        );

    testWidgets('PincodeView displays logo correctly',
        (WidgetTester tester) async {
      // Define a callback function for onComplete
      void onComplete(String value) {}

      // Build a MaterialApp with PincodeView inside for testing
      await widgetPumper(
        tester,
        length: 4,
        onComplete: onComplete,
        label: const Text('Enter PIN code:'),
        logo: const Icon(Icons.lock),
      );
      await tester.pump();

      // Verify that the logo is displayed
      expect(find.byIcon(Icons.lock), findsOneWidget);
    });

    testWidgets('PincodeView validation works correctly',
        (WidgetTester tester) async {
      // Define a callback function for onComplete
      String? pincodeResult;
      void onComplete(String value) {
        pincodeResult = value;
      }

      await widgetPumper(
        tester,
        length: 4,
        onComplete: onComplete,
        label: const Text('Enter PIN code:'),
      );
      await tester.pump();

      // Tap keypad numbers to enter incomplete PIN code
      await tester.tap(find.text('1'));
      await tester.tap(find.text('2'));
      await tester.tap(find.text('3'));
      await tester.pump();

      // Verify that the onComplete callback is not called for incomplete PIN code
      expect(pincodeResult, isNull);
    });

    testWidgets('PincodeView renders with custom keypad text style',
        (WidgetTester tester) async {
      // Define a callback function for onComplete
      void onComplete(String value) {}

      await widgetPumper(
        tester,
        length: 4,
        onComplete: onComplete,
        label: const Text('Enter PIN code:'),
        keypadTextStyle: const TextStyle(color: Colors.red),
      );
      await tester.pump();

      // Verify that the keypad numbers are rendered with the custom text style
      expect(find.text('1'), findsOneWidget);
      expect(
        tester.widget<Text>(find.text('1')).style!.color,
        equals(Colors.red),
      );
    });

    testWidgets('PincodeView displays indicator correctly',
        (WidgetTester tester) async {
      void onComplete(String value) {}

      await widgetPumper(
        tester,
        length: 4,
        onComplete: onComplete,
        label: const Text('Enter PIN code:'),
        indicatorColor: Colors.blue,
        indicatorInactiveColor: Colors.grey,
      );
      await tester.pump();

      // Verify that the indicators are displayed with the correct colors
      expect(find.byType(CircleAvatar), findsNWidgets(4));

      await tester.tap(find.text('3'));
      await tester.pump();
      expect(
        tester
            .widget<CircleAvatar>(find.byType(CircleAvatar).last)
            .backgroundColor,
        equals(Colors.grey),
      );
      expect(
        tester
            .widget<CircleAvatar>(find.byType(CircleAvatar).first)
            .backgroundColor,
        equals(Colors.blue),
      );
    });
  });
}

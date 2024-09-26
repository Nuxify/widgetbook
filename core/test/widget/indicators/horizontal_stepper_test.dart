import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuxify_widgetbook/indicators/horizontal_stepper.dart';
import 'package:nuxify_widgetbook/test/main_test.dart';

void main() {
  Future<void> widgetPumper(
    WidgetTester tester, {
    required int length,
    required int currentStep,
    Color? activeColor,
    Color inactiveColor = Colors.grey,
    double stepPadding = 8,
    double indicatorThickness = 2,
    double borderRadius = 0,
  }) async =>
      tester.pumpWidget(
        universalPumper(
          Scaffold(
            body: HorizontalStepper(
              length: length,
              currentStep: currentStep,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              stepPadding: stepPadding,
              indicatorThickness: indicatorThickness,
              borderRadius: borderRadius,
            ),
          ),
        ),
      );
  group('Horizontal Stepper.', () {
    testWidgets('Default HorizontalStepper test', (WidgetTester tester) async {
      const int totalContainer = 10;
      await widgetPumper(
        tester,
        length: 5,
        currentStep: 2,
      );
      await tester.pump();

      // Verify the number of step indicators
      expect(find.byType(Container), findsNWidgets(totalContainer));

      // Verify the active and inactive step colors
      final containers =
          tester.widgetList<Container>(find.byType(Container)).toList();
      for (int i = 0; i < totalContainer; i++) {
        final decoration = containers[i].decoration as BoxDecoration?;
        if (decoration == null) continue;

        if (i < 4) {
          expect(decoration.color, equals(const Color(0xff6750a4)));
        } else {
          expect(decoration.color, equals(Colors.grey));
        }
      }
    });

    testWidgets('Current step test', (WidgetTester tester) async {
      const int totalContainer = 10;
      await widgetPumper(
        tester,
        length: 5,
        currentStep: 3,
      );
      await tester.pump();

      // Verify the active and inactive step colors
      final containers =
          tester.widgetList<Container>(find.byType(Container)).toList();
      for (int i = 0; i < totalContainer; i++) {
        final decoration = containers[i].decoration as BoxDecoration?;
        if (decoration == null) continue;

        if (i < 6) {
          expect(decoration.color, equals(const Color(0xff6750a4)));
        } else {
          expect(decoration.color, equals(Colors.grey));
        }
      }
    });

    testWidgets('Custom colors test', (WidgetTester tester) async {
      const int totalContainer = 10;
      await widgetPumper(
        tester,
        length: 5,
        currentStep: 2,
        activeColor: Colors.green,
        inactiveColor: Colors.red,
      );
      await tester.pump();

      // Verify the custom active and inactive step colors
      final containers =
          tester.widgetList<Container>(find.byType(Container)).toList();
      for (int i = 0; i < totalContainer; i++) {
        final decoration = containers[i].decoration as BoxDecoration?;
        if (decoration == null) continue;

        if (i < 4) {
          expect(decoration.color, equals(Colors.green));
        } else {
          expect(decoration.color, equals(Colors.red));
        }
      }
    });

    testWidgets('Custom step padding test', (WidgetTester tester) async {
      await widgetPumper(
        tester,
        length: 5,
        currentStep: 2,
        stepPadding: 16,
      );
      await tester.pump();

      // Verify the custom step padding
      final containers =
          tester.widgetList<Container>(find.byType(Container)).toList();
      for (int i = 0; i < 4; i++) {
        final container = containers[i];
        if (container.decoration == null) {
          expect((container.margin as EdgeInsets).right, equals(16));
        }
      }
    });

    testWidgets('Custom indicator thickness test', (WidgetTester tester) async {
      await widgetPumper(
        tester,
        length: 5,
        currentStep: 2,
        indicatorThickness: 4,
      );
      await tester.pump();

      // Verify the custom indicator thickness
      final containers =
          tester.widgetList<Container>(find.byType(Container)).toList();
      for (int i = 0; i < 10; i++) {
        final decoration = containers[i].decoration as BoxDecoration?;
        if (decoration == null) continue;
        final container = containers[i];
        expect(container.constraints!.maxHeight, equals(4));
      }
    });

    testWidgets('Custom border radius test', (WidgetTester tester) async {
      await widgetPumper(
        tester,
        length: 5,
        currentStep: 2,
        borderRadius: 8,
      );
      await tester.pump();

      // Verify the custom border radius
      final containers =
          tester.widgetList<Container>(find.byType(Container)).toList();
      for (int i = 0; i < 10; i++) {
        final decoration = containers[i].decoration as BoxDecoration?;
        if (decoration == null) continue;
        expect(decoration.borderRadius, equals(BorderRadius.circular(8)));
      }
    });
  });
}

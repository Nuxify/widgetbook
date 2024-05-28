import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuxify_widgetbook/indicators/chip.dart';
import 'package:nuxify_widgetbook/test/main_test.dart';

void main() {
  Future<void> widgetPumper(
    WidgetTester tester, {
    Color? color,
    Widget? child,
    EdgeInsets? padding,
    void Function()? onTap,
  }) async =>
      tester.pumpWidget(universalPumper(
        Scaffold(
          body: ChipIndicator(
            backgroundColor: color,
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            onTap: onTap,
            child: child ?? const Text('Default Chip'),
          ),
        ),
      ));

  group('Chip.', () {
    testWidgets('Default ChipIndicator test', (WidgetTester tester) async {
      await widgetPumper(tester);
      await tester.pump();
      // Verify the child text is displayed
      expect(find.text('Default Chip'), findsOneWidget);

      // Verify the default background color
      final container =
          tester.widget<AnimatedContainer>(find.byType(AnimatedContainer));
      final BoxDecoration decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(const Color(0x1a6750a4)));
    });

    testWidgets('Custom background color test', (WidgetTester tester) async {
      await widgetPumper(
        tester,
        child: const Text('Custom Background Color Chip'),
        color: Colors.red,
      );
      await tester.pump();

      // Verify the child text is displayed
      expect(find.text('Custom Background Color Chip'), findsOneWidget);

      // Verify the custom background color
      final container =
          tester.widget<AnimatedContainer>(find.byType(AnimatedContainer));
      final BoxDecoration decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(Colors.red));
    });

    testWidgets('Custom padding test', (WidgetTester tester) async {
      await widgetPumper(
        tester,
        child: const Text('Custom Padding Chip'),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        color: Colors.red,
      );
      await tester.pump();

      // Verify the child text is displayed
      expect(find.text('Custom Padding Chip'), findsOneWidget);

      // Verify the custom padding
      final container =
          tester.widget<AnimatedContainer>(find.byType(AnimatedContainer));
      expect(container.padding,
          equals(const EdgeInsets.symmetric(horizontal: 30, vertical: 10)));
    });

    testWidgets('Tap callback test', (WidgetTester tester) async {
      bool tapped = false;

      await widgetPumper(
        tester,
        child: const Text('Tap Chip'),
        onTap: () {
          tapped = true;
        },
      );
      await tester.pump();

      // Verify the child text is displayed
      expect(find.text('Tap Chip'), findsOneWidget);

      // Tap the ChipIndicator
      await tester.tap(find.byType(ChipIndicator));
      await tester.pumpAndSettle();

      // Verify the onTap callback is triggered
      expect(tapped, isTrue);
    });
  });
}

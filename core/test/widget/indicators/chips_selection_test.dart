import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuxify_widgetbook_core/indicators/chips_selection.dart';
import 'package:nuxify_widgetbook_core/test/main_test.dart';

void main() {
  Future<void> widgetPumper(
    WidgetTester tester, {
    required List<String> items,
    required List<int> activeIndexes,
    Color? activeColor,
    Color? inactiveColor,
    TextStyle? activeTextStyle,
    TextStyle? inactiveTextStyle,
    void Function(int)? onTap,
    double spacing = 2,
  }) async =>
      tester.pumpWidget(
        universalPumper(
          Scaffold(
            body: ChipsSelection(
              items: items,
              activeIndexes: activeIndexes,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              activeTextStyle: activeTextStyle,
              inactiveTextStyle: inactiveTextStyle,
              onTap: onTap,
              spacing: spacing,
            ),
          ),
        ),
      );
  group('Chip Selection.', () {
    testWidgets('Default ChipsSelection test', (WidgetTester tester) async {
      await widgetPumper(
        tester,
        items: ['Chip 1', 'Chip 2', 'Chip 3'],
        activeIndexes: [],
      );
      await tester.pump();

      // Verify all chips are displayed
      expect(find.text('Chip 1'), findsOneWidget);
      expect(find.text('Chip 2'), findsOneWidget);
      expect(find.text('Chip 3'), findsOneWidget);

      // Verify default colors (assuming default theme color is blue)
      final chip1Container = tester
          .widget<AnimatedContainer>(find.byType(AnimatedContainer).at(0));
      final chip2Container = tester
          .widget<AnimatedContainer>(find.byType(AnimatedContainer).at(1));
      final chip3Container = tester
          .widget<AnimatedContainer>(find.byType(AnimatedContainer).at(2));
      final BoxDecoration decoration1 =
          chip1Container.decoration as BoxDecoration;
      final BoxDecoration decoration2 =
          chip2Container.decoration as BoxDecoration;
      final BoxDecoration decoration3 =
          chip3Container.decoration as BoxDecoration;
      expect(
        decoration1.color,
        equals(const Color(0x1a6750a4).withValues(alpha: 0.1)),
      );
      expect(decoration2.color,
          equals(const Color(0x1a6750a4).withValues(alpha: 0.1)));
      expect(decoration3.color,
          equals(const Color(0x1a6750a4).withValues(alpha: 0.1)));
    });

    testWidgets('Active Chip test', (WidgetTester tester) async {
      await widgetPumper(
        tester,
        items: ['Chip 1', 'Chip 2', 'Chip 3'],
        activeIndexes: [1],
      );
      await tester.pump();

      // Verify all chips are displayed
      expect(find.text('Chip 1'), findsOneWidget);
      expect(find.text('Chip 2'), findsOneWidget);
      expect(find.text('Chip 3'), findsOneWidget);

      // Verify the active chip color (assuming default theme color is blue)
      final chip2Container = tester
          .widget<AnimatedContainer>(find.byType(AnimatedContainer).at(1));
      final BoxDecoration decoration2 =
          chip2Container.decoration as BoxDecoration;
      expect(decoration2.color, equals(const Color(0xff6750a4)));
    });

    testWidgets('Custom colors test', (WidgetTester tester) async {
      await widgetPumper(
        tester,
        items: ['Chip 1', 'Chip 2', 'Chip 3'],
        activeIndexes: [0, 2],
        activeColor: Colors.green,
        inactiveColor: Colors.red,
      );
      await tester.pump();

      // Verify all chips are displayed
      expect(find.text('Chip 1'), findsOneWidget);
      expect(find.text('Chip 2'), findsOneWidget);
      expect(find.text('Chip 3'), findsOneWidget);

      // Verify custom colors
      final chip1Container = tester
          .widget<AnimatedContainer>(find.byType(AnimatedContainer).at(0));
      final chip2Container = tester
          .widget<AnimatedContainer>(find.byType(AnimatedContainer).at(1));
      final chip3Container = tester
          .widget<AnimatedContainer>(find.byType(AnimatedContainer).at(2));
      final BoxDecoration decoration1 =
          chip1Container.decoration as BoxDecoration;
      final BoxDecoration decoration2 =
          chip2Container.decoration as BoxDecoration;
      final BoxDecoration decoration3 =
          chip3Container.decoration as BoxDecoration;
      expect(decoration1.color, equals(Colors.green));
      expect(decoration2.color, equals(Colors.red));
      expect(decoration3.color, equals(Colors.green));
    });

    testWidgets('Custom text styles test', (WidgetTester tester) async {
      await widgetPumper(
        tester,
        items: ['Chip 1', 'Chip 2', 'Chip 3'],
        activeIndexes: [1],
        activeTextStyle: const TextStyle(color: Colors.white),
        inactiveTextStyle: const TextStyle(color: Colors.black),
      );
      await tester.pump();

      // Verify all chips are displayed
      expect(find.text('Chip 1'), findsOneWidget);
      expect(find.text('Chip 2'), findsOneWidget);
      expect(find.text('Chip 3'), findsOneWidget);

      // Verify custom text styles
      final chip1Text = tester.widget<Text>(find.text('Chip 1'));
      final chip2Text = tester.widget<Text>(find.text('Chip 2'));
      final chip3Text = tester.widget<Text>(find.text('Chip 3'));
      expect(chip1Text.style?.color, equals(Colors.black));
      expect(chip2Text.style?.color, equals(Colors.white));
      expect(chip3Text.style?.color, equals(Colors.black));
    });

    testWidgets('Tap callback test', (WidgetTester tester) async {
      int tappedIndex = -1;

      await widgetPumper(
        tester,
        items: ['Chip 1', 'Chip 2', 'Chip 3'],
        activeIndexes: [],
        onTap: (index) {
          tappedIndex = index;
        },
      );
      await tester.pump();

      // Verify all chips are displayed
      expect(find.text('Chip 1'), findsOneWidget);
      expect(find.text('Chip 2'), findsOneWidget);
      expect(find.text('Chip 3'), findsOneWidget);

      // Tap the second chip
      await tester.tap(find.text('Chip 2'));
      await tester.pumpAndSettle();

      // Verify the onTap callback is triggered with the correct index
      expect(tappedIndex, equals(1));
    });
  });
}

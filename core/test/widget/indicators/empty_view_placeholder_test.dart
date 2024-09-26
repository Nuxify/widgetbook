import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuxify_widgetbook_core/indicators/empty_view_placeholder.dart';
import 'package:nuxify_widgetbook_core/test/main_test.dart';

void main() {
  Future<void> widgetPumper(
    WidgetTester tester, {
    required Widget graphic,
    required Widget label,
    double height = 200,
  }) async =>
      tester.pumpWidget(
        universalPumper(
          Scaffold(
            body: EmptyViewPlaceholder(
              graphic: graphic,
              label: label,
              height: height,
            ),
          ),
        ),
      );
  group('Empty View Placeholder.', () {
    testWidgets('Default EmptyViewPlaceholder test',
        (WidgetTester tester) async {
      await widgetPumper(
        tester,
        graphic: const Icon(Icons.image),
        label: const Text('No items to display'),
      );
      await tester.pump();

      // Verify the graphic and label are displayed
      expect(find.byIcon(Icons.image), findsOneWidget);
      expect(find.text('No items to display'), findsOneWidget);

      // Verify the default height
      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.height, equals(200));
    });

    testWidgets('Custom height test', (WidgetTester tester) async {
      await widgetPumper(
        tester,
        graphic: const Icon(Icons.image),
        label: const Text('No items to display'),
        height: 300,
      );
      await tester.pump();

      // Verify the custom height
      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.height, equals(300));
    });

    testWidgets('Graphic and label display test', (WidgetTester tester) async {
      await widgetPumper(
        tester,
        graphic: const Icon(Icons.image),
        label: const Text('No items to display'),
      );
      await tester.pump();

      // Verify the graphic and label are displayed
      expect(find.byIcon(Icons.image), findsOneWidget);
      expect(find.text('No items to display'), findsOneWidget);

      // Verify the alignment of the graphic and label
      final column = tester.widget<Column>(find.byType(Column));
      expect(column.mainAxisAlignment, equals(MainAxisAlignment.center));
      expect(column.crossAxisAlignment, equals(CrossAxisAlignment.center));
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuxify_widgetbook/views/bottomsheet.dart';

void main() {
  group('Bottomsheet', () {
    testWidgets('Displays body content correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => Center(
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => const AppBottomsheet(
                        body: Text('Body content'),
                        isExpanded: false,
                      ),
                    );
                  },
                  child: const Text('Show Bottomsheet'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show Bottomsheet'));
      await tester.pumpAndSettle();

      expect(find.text('Body content'), findsOneWidget);
    });

    testWidgets('Displays title, leading, and trailing widgets correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => Center(
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => const AppBottomsheet(
                        body: Text('Body content'),
                        isExpanded: false,
                        title: Text('Title'),
                        leading: Icon(Icons.menu),
                        trailing: Icon(Icons.close),
                      ),
                    );
                  },
                  child: const Text('Show Bottomsheet'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show Bottomsheet'));
      await tester.pumpAndSettle();

      expect(find.text('Body content'), findsOneWidget);
      expect(find.text('Title'), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('Expands body content when isExpanded is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => Center(
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => const AppBottomsheet(
                        body: Text('Body content'),
                        isExpanded: true,
                      ),
                    );
                  },
                  child: const Text('Show Bottomsheet'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show Bottomsheet'));
      await tester.pumpAndSettle();

      final expandedFinder = find.byType(Expanded);
      expect(expandedFinder, findsOneWidget);
    });

    testWidgets('Does not expand body content when isExpanded is false',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => Center(
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => const AppBottomsheet(
                        body: Text('Body content'),
                        isExpanded: false,
                      ),
                    );
                  },
                  child: const Text('Show Bottomsheet'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show Bottomsheet'));
      await tester.pumpAndSettle();

      final expandedFinder = find.byType(Expanded);
      expect(expandedFinder, findsNothing);
    });
  });
}

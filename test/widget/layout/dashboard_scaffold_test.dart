import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuxify_widgetbook/layout/dashboard_scaffold.dart';
import 'package:nuxify_widgetbook/navigation/app_bottom_navigation.dart';
import 'package:nuxify_widgetbook/test/main_test.dart';

void main() {
  Future<void> widgetPumper(
    WidgetTester tester,
  ) async =>
      tester.pumpWidget(
        universalPumper(const DashboardScaffold()),
      );
  // Initial State Test
  testWidgets('Initial state is Home tab active', (WidgetTester tester) async {
    await widgetPumper(tester);
    await tester.pump();

    expect(find.text('Home'), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);

    // Check that Home icon and label are in active color
    final homeIcon = tester.widget<Icon>(find.byIcon(Icons.home));
    final homeLabel = tester.widget<Text>(find.text('Home'));

    expect(homeIcon.color, Colors.green);
    expect(homeLabel.style?.color, Colors.green);
  });

  // Tab Navigation Test
  testWidgets('Navigates between tabs correctly', (WidgetTester tester) async {
    await widgetPumper(tester);
    await tester.pump();

    // Tap on the Chats tab
    await tester.tap(find.text('Chats'));
    await tester.pump();

    // Check that Chats icon and label are in active color
    final chatsIcon = tester.widget<Icon>(find.byIcon(Icons.chat));
    final chatsLabel = tester.widget<Text>(find.text('Chats'));

    expect(chatsIcon.color, Colors.green);
    expect(chatsLabel.style?.color, Colors.green);
  });

  // Widget Tree Test
  testWidgets('DashboardScaffold contains ListView and AppBottomNavigation',
      (WidgetTester tester) async {
    await widgetPumper(tester);
    await tester.pump();

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(AppBottomNavigation), findsOneWidget);
  });

  // Tab Text Display Test
  testWidgets('Displays correct text for each tab',
      (WidgetTester tester) async {
    await widgetPumper(tester);
    await tester.pump();

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Chats'), findsOneWidget);
    expect(find.text('Rewards'), findsOneWidget);
    expect(find.text('Cart'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Menu'), findsOneWidget);
  });

  // Icon Color Change Test
  testWidgets('Icon color changes on tab tap', (WidgetTester tester) async {
    await widgetPumper(tester);
    await tester.pump();
    // Initial active tab is Home
    expect(tester.widget<Icon>(find.byIcon(Icons.home)).color, Colors.green);

    // Tap on the Profile tab
    await tester.tap(find.text('Profile'));
    await tester.pump();

    // Check that Profile icon is active and Home icon is inactive
    expect(tester.widget<Icon>(find.byIcon(Icons.person_4_rounded)).color,
        Colors.green);
    expect(tester.widget<Icon>(find.byIcon(Icons.home)).color, Colors.black54);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuxify_widgetbook/navigation/app_bottom_navigation.dart';
import 'package:nuxify_widgetbook/test/main_test.dart';

void main() {
  Widget createTestWidget({required int activeIndex}) {
    return MaterialApp(
      home: Scaffold(
        body: AppBottomNavigation(
          isFloatingBottomNavBar: false,
          activeIndex: activeIndex,
          items: [
            BottomNavigationItem(
              onTap: () {},
              label: Text(
                'Home',
                style: TextStyle(
                  fontSize: 11,
                  color: activeIndex == 0 ? Colors.green : Colors.black54,
                ),
              ),
              icon: Icon(
                Icons.home,
                size: 20,
                color: activeIndex == 0 ? Colors.green : Colors.black54,
              ),
            ),
            BottomNavigationItem(
              onTap: () {},
              label: Text(
                'Chats',
                style: TextStyle(
                  fontSize: 11,
                  color: activeIndex == 1 ? Colors.green : Colors.black54,
                ),
              ),
              icon: Icon(
                Icons.chat,
                size: 20,
                color: activeIndex == 1 ? Colors.green : Colors.black54,
              ),
            ),
            BottomNavigationItem(
              onTap: () {},
              label: Text(
                'Rewards',
                style: TextStyle(
                  fontSize: 11,
                  color: activeIndex == 2 ? Colors.green : Colors.black54,
                ),
              ),
              icon: Icon(
                Icons.golf_course_sharp,
                size: 20,
                color: activeIndex == 2 ? Colors.green : Colors.black54,
              ),
            ),
            BottomNavigationItem(
              onTap: () {},
              label: Text(
                'Cart',
                style: TextStyle(
                  fontSize: 11,
                  color: activeIndex == 3 ? Colors.green : Colors.black54,
                ),
              ),
              icon: Icon(
                Icons.shopping_basket,
                size: 20,
                color: activeIndex == 3 ? Colors.green : Colors.black54,
              ),
            ),
            BottomNavigationItem(
              onTap: () {},
              label: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 11,
                  color: activeIndex == 4 ? Colors.green : Colors.black54,
                ),
              ),
              icon: Icon(
                Icons.person_4_rounded,
                size: 20,
                color: activeIndex == 4 ? Colors.green : Colors.black54,
              ),
            ),
            BottomNavigationItem(
              onTap: () {},
              label: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 11,
                  color: activeIndex == 5 ? Colors.green : Colors.black54,
                ),
              ),
              icon: Icon(
                Icons.menu,
                size: 20,
                color: activeIndex == 5 ? Colors.green : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> widgetPumper(
    WidgetTester tester, {
    required int activeIndex,
  }) async =>
      tester.pumpWidget(
        universalPumper(createTestWidget(activeIndex: activeIndex)),
      );
  group('App Botto Navigation.', () {
    testWidgets('Initial state is correct tab active',
        (WidgetTester tester) async {
      await widgetPumper(tester, activeIndex: 0);
      await tester.pump();

      expect(find.text('Home'), findsOneWidget);
      expect(find.byIcon(Icons.home), findsOneWidget);

      final homeIcon = tester.widget<Icon>(find.byIcon(Icons.home));
      final homeLabel = tester.widget<Text>(find.text('Home'));

      expect(homeIcon.color, Colors.green);
      expect(homeLabel.style?.color, Colors.green);
    });

    // Tab Navigation Test
    testWidgets('Navigates between tabs correctly',
        (WidgetTester tester) async {
      await widgetPumper(tester, activeIndex: 1);
      await tester.pump();

      final chatsIcon = tester.widget<Icon>(find.byIcon(Icons.chat));
      final chatsLabel = tester.widget<Text>(find.text('Chats'));

      expect(chatsIcon.color, Colors.green);
      expect(chatsLabel.style?.color, Colors.green);

      final homeIcon = tester.widget<Icon>(find.byIcon(Icons.home));
      final homeLabel = tester.widget<Text>(find.text('Home'));

      expect(homeIcon.color, Colors.black54);
      expect(homeLabel.style?.color, Colors.black54);
    });

    testWidgets('AppBottomNavigation contains required widgets',
        (WidgetTester tester) async {
      await widgetPumper(tester, activeIndex: 0);
      await tester.pump();

      expect(find.byType(IconButton), findsNWidgets(6));
    });

    testWidgets('Displays correct text for each tab',
        (WidgetTester tester) async {
      await widgetPumper(tester, activeIndex: 0);
      await tester.pump();

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Chats'), findsOneWidget);
      expect(find.text('Rewards'), findsOneWidget);
      expect(find.text('Cart'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
      expect(find.text('Menu'), findsOneWidget);
    });

    testWidgets('Icon color changes on tab tap', (WidgetTester tester) async {
      await widgetPumper(tester, activeIndex: 0);
      await tester.pump();

      // Initial active tab is Home
      expect(tester.widget<Icon>(find.byIcon(Icons.home)).color, Colors.green);

      await tester.pumpWidget(createTestWidget(activeIndex: 4));
      await tester.pump();

      // Check that Profile icon is active and Home icon is inactive
      expect(tester.widget<Icon>(find.byIcon(Icons.person_4_rounded)).color,
          Colors.green);
      expect(
          tester.widget<Icon>(find.byIcon(Icons.home)).color, Colors.black54);
    });
  });
}

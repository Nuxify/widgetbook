import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuxify_widgetbook_core/input/filled_textfield.dart';
import 'package:nuxify_widgetbook_core/test/main_test.dart';

void main() {
  Future<void> widgetPumper(
    WidgetTester tester, {
    TextEditingController? controller,
    Color? fillColor,
    double borderRadius = 30,
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    String? Function(String?)? validator,
    String? hintText,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    String? labelText,
    TextStyle? textStyle,
    bool isDense = false,
    bool obscureText = false,
    FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.always,
    Widget? suffix,
    Widget? prefix,
  }) async =>
      tester.pumpWidget(
        universalPumper(
          Scaffold(
            body: FilledTextField(
              controller: controller,
              fillColor: fillColor,
              borderRadius: borderRadius,
              contentPadding: contentPadding,
              validator: validator,
              hintText: hintText,
              labelText: labelText,
              hintStyle: hintStyle,
              labelStyle: labelStyle,
              textStyle: textStyle,
              isDense: isDense,
              obscureText: obscureText,
              floatingLabelBehavior: floatingLabelBehavior,
              suffix: suffix,
              prefix: prefix,
              maxLines: 1,
            ),
          ),
        ),
      );
  group('Filled TextField.', () {
    testWidgets('Default FilledTextField test', (WidgetTester tester) async {
      await widgetPumper(tester);
      await tester.pump();

      // Verify the default fill color
      final textField = tester.widget<TextField>(find.byType(TextField));
      final decoration = textField.decoration as InputDecoration;

      expect(decoration.fillColor, equals(Colors.black.withOpacity(0.05)));
    });

    testWidgets('Custom fill color test', (WidgetTester tester) async {
      await widgetPumper(tester, fillColor: Colors.blue);
      await tester.pump();

      // Verify the custom fill color
      final textField = tester.widget<TextField>(find.byType(TextField));

      final decoration = textField.decoration as InputDecoration;
      expect(decoration.fillColor, equals(Colors.blue));
    });

    testWidgets('Custom border radius test', (WidgetTester tester) async {
      await widgetPumper(tester, borderRadius: 15);
      await tester.pump();

      // Verify the custom border radius
      final textField = tester.widget<TextField>(find.byType(TextField));
      final decoration = textField.decoration as InputDecoration;
      final border = decoration.border as OutlineInputBorder;

      expect(border.borderRadius, equals(BorderRadius.circular(15)));
    });

    testWidgets('Custom content padding test', (WidgetTester tester) async {
      await widgetPumper(tester, contentPadding: const EdgeInsets.all(20));
      await tester.pump();
      // Verify the custom content padding
      final textField = tester.widget<TextField>(find.byType(TextField));
      final decoration = textField.decoration as InputDecoration;
      expect(decoration.contentPadding, equals(const EdgeInsets.all(20)));
    });

    testWidgets('Hint text and style test', (WidgetTester tester) async {
      await widgetPumper(
        tester,
        hintText: 'Enter text',
        hintStyle: const TextStyle(color: Colors.red),
      );
      await tester.pump();

      // Verify the hint text and style
      final textField = tester.widget<TextField>(find.byType(TextField));
      final decoration = textField.decoration as InputDecoration;
      expect(decoration.hintText, equals('Enter text'));
      expect(decoration.hintStyle, equals(const TextStyle(color: Colors.red)));
    });

    testWidgets('Label text and style test', (WidgetTester tester) async {
      await widgetPumper(
        tester,
        labelText: 'Label',
        labelStyle: const TextStyle(color: Colors.green),
      );
      await tester.pump();

      // Verify the label text and style
      final textField = tester.widget<TextField>(find.byType(TextField));
      final decoration = textField.decoration as InputDecoration;
      expect(decoration.labelText, equals('Label'));
      expect(
          decoration.labelStyle, equals(const TextStyle(color: Colors.green)));
    });

    testWidgets('Text style test', (WidgetTester tester) async {
      await widgetPumper(tester,
          textStyle: const TextStyle(color: Colors.purple));
      await tester.pump();

      // Verify the text style
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.style, equals(const TextStyle(color: Colors.purple)));
    });

    testWidgets('Prefix and suffix widgets test', (WidgetTester tester) async {
      await widgetPumper(
        tester,
        prefix: const Icon(Icons.person),
        suffix: const Icon(Icons.visibility),
      );
      await tester.pump();
      // Verify the prefix and suffix widgets
      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });

    testWidgets('Obscure text test', (WidgetTester tester) async {
      await widgetPumper(tester, obscureText: true);
      await tester.pump();

      // Verify the obscure text property
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.obscureText, isTrue);
    });
  });
}

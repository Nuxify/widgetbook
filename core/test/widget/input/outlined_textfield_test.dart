import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuxify_widgetbook/input/outlined_textfield.dart';
import 'package:nuxify_widgetbook/test/main_test.dart';

void main() {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> widgetPumper(
    WidgetTester tester, {
    TextEditingController? controller,
    double borderRadius = 30,
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    String? Function(String?)? validator,
    Color focusedBorderColor = Colors.black,
    Color borderColor = Colors.black26,
    Color errorBorderColor = Colors.redAccent,
    String? hintText,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    String? labelText,
    TextStyle? textStyle,
    bool isDense = false,
    bool obscureText = false,
    FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.always,
    Widget? prefix,
    Widget? suffix,
  }) async =>
      tester.pumpWidget(
        universalPumper(
          Scaffold(
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  OutlinedTextField(
                    controller: controller,
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
                  ),
                  ElevatedButton(
                      onPressed: () => formKey.currentState?.validate(),
                      child: const Text('Button')),
                ],
              ),
            ),
          ),
        ),
      );
  group('Outlined Textfield', () {
    testWidgets('renders correctly',
        (WidgetTester tester) async {
      await widgetPumper(
        tester,
        controller: TextEditingController(),
        hintText: 'Enter your text here',
        labelText: 'Text Field',
        errorBorderColor: Colors.redAccent,
        borderRadius: 30,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      );
      await tester.pump();

      // Find the widget by its label text
      final textFieldFinder = find.byWidgetPredicate((widget) =>
          widget is TextField && widget.decoration!.labelText == 'Text Field');

      // Verify that the is rendered
      expect(textFieldFinder, findsOneWidget);

      // Enter text into the OutlinedTextField
      await tester.enterText(textFieldFinder, 'Test Input');

      // Submit the form
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      // Verify that the entered text is displayed
      expect(find.text('Test Input'), findsOneWidget);
    });

    testWidgets('validation works correctly',
        (WidgetTester tester) async {
      await widgetPumper(
        tester,
        controller: TextEditingController(),
        hintText: 'Enter your text here',
        labelText: 'Text Field',
        errorBorderColor: Colors.redAccent,
        borderRadius: 30,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      );
      await tester.pump();

      // Find the widget by its label text
      final textFieldFinder = find.byWidgetPredicate((widget) =>
          widget is TextField && widget.decoration!.labelText == 'Text Field');

      // Enter empty text into the OutlinedTextField
      await tester.enterText(textFieldFinder, '');

      // Submit the form
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Verify that the validation error message is displayed
      expect(find.text('Please enter some text'), findsOneWidget);
    });
  });
}

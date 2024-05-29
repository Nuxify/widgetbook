import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuxify_widgetbook/input/stack_textfield.dart';
import 'package:nuxify_widgetbook/test/main_test.dart';

void main() {
  Future<void> widgetPumper(
    WidgetTester tester, {
    required String hintText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    TextInputAction? textInputAction,
    List<TextInputFormatter>? inputFormatters,
    FocusNode? focusNode,
    void Function(String)? onChanged,
    String? label,
    TextInputType? keyboardType,
    void Function()? onTap,
    bool? readOnly,
    Widget? suffixIcon,
    EdgeInsets? scrollPadding,
    int? maxLines,
    AutovalidateMode? autovalidateMode,
    TextStyle? style,
    bool? isDense,
    Widget? prefixIcon,
    String? suffixText,
    TextStyle? suffixStyle,
    void Function(String)? onFieldSubmitted,
    bool? enabled,
    Widget? textField,
    bool obscuringText = false,
    void Function()? onEditingComplete,
    void Function(bool)? onFocusChange,
    Color? fillColor,
    Color? labelColor,
  }) async =>
      tester.pumpWidget(
        universalPumper(
          Scaffold(
            body: StackTextField(
              hintText: hintText,
              controller: controller,
              validator: validator,
              textInputAction: textInputAction,
              inputFormatters: inputFormatters,
              focusNode: focusNode,
              onChanged: onChanged,
              label: label,
              keyboardType: keyboardType,
              onTap: onTap,
              readOnly: readOnly,
              suffixIcon: suffixIcon,
              scrollPadding: scrollPadding,
              maxLines: maxLines,
              autovalidateMode: autovalidateMode,
              style: style,
              isDense: isDense,
              prefixIcon: prefixIcon,
              suffixText: suffixText,
              suffixStyle: suffixStyle,
              onFieldSubmitted: onFieldSubmitted,
              enabled: enabled,
              textField: textField,
              obscuringText: obscuringText,
              onEditingComplete: onEditingComplete,
              onFocusChange: onFocusChange,
              fillColor: fillColor,
              labelColor: labelColor,
            ),
          ),
        ),
      );
  group('Stack TextField.', () {
    testWidgets('StackTextField renders correctly',
        (WidgetTester tester) async {
      await widgetPumper(tester, hintText: '');
      await tester.pump();

      // Verify that the StackTextField is rendered
      expect(find.byType(StackTextField), findsOneWidget);
    });

    testWidgets('StackTextField displays hint text correctly',
        (WidgetTester tester) async {
      await widgetPumper(
        tester,
        hintText: 'Enter text',
        controller: TextEditingController(),
      );
      await tester.pump();

      // Verify that the hint text is displayed
      expect(find.text('Enter text'), findsOneWidget);
    });

    testWidgets('StackTextField calls onChanged callback',
        (WidgetTester tester) async {
      String? onChangedValue;

      await widgetPumper(
        tester,
        hintText: 'Enter text',
        controller: TextEditingController(),
        onChanged: (value) => onChangedValue = value,
      );
      await tester.pump();
      // Enter text into the StackTextField
      await tester.enterText(find.byType(TextField), 'Test Input');
      await tester.pump();

      expect(onChangedValue, 'Test Input');
    });

    testWidgets(
        'On valu text field is not empty, the label above should be visible.',
        (WidgetTester tester) async {
      await widgetPumper(
        tester,
        hintText: 'Enter text',
        controller: TextEditingController(),
      );
      await tester.pump();

      expect(find.byKey(const Key('stackLabel')), findsNothing);
      // Enter text into the StackTextField
      await tester.enterText(find.byType(TextField), 'Test Input');
      await tester.pump();

      expect(find.byKey(const Key('stackLabel')), findsOneWidget);
    });
  });
}

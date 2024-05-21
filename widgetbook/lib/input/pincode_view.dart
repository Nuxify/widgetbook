import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook/input/pincode_view.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: PincodeView)
Widget defaultUseCase(BuildContext context) {
  final double height = MediaQuery.of(context).size.height;
  return MaterialApp(
    theme: ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
        background: context.knobs.color(
          label: 'Keypad Background Color',
          initialValue: Colors.white10,
        ),
      ),
    ),
    debugShowCheckedModeBanner: false,
    home: Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: SizedBox(
        height: height * 0.7,
        child: Center(
          child: Column(
            children: <Widget>[
              PincodeView(
                keypadTextStyle: TextStyle(
                  color: context.knobs.color(
                    label: 'Keypad Text Color',
                    initialValue: Colors.white,
                  ),
                  fontSize: context.knobs.double.slider(
                    label: 'Keypad Text Size',
                    initialValue: 12,
                    min: 12,
                    max: 20,
                  ),
                ),
                indicatorColor: context.knobs.color(
                  label: 'Indicator Color',
                ),
                indicatorInactiveColor: context.knobs.color(
                  label: 'Indicator Inactive Color',
                  initialValue: Colors.grey.shade800,
                ),
                logo: context.knobs
                        .boolean(label: 'Show Logo', initialValue: true)
                    ? Icon(
                        Icons.ac_unit_outlined,
                        color: context.knobs.color(
                          label: 'Logo Color',
                        ),
                        size: context.knobs.double.slider(
                          label: 'Logo Size',
                          min: 40,
                          max: 70,
                          initialValue: 40,
                        ),
                      )
                    : null,
                label: context.knobs
                        .boolean(label: 'Show Label', initialValue: true)
                    ? Text(
                        context.knobs
                            .string(label: 'Label', initialValue: 'Label here'),
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: context.knobs.color(
                            label: 'Label Text Color',
                          ),
                          fontSize: context.knobs.double.slider(
                              label: 'Label Text Font Size',
                              initialValue: 20,
                              min: 11,
                              max: 30),
                        ),
                      )
                    : null,
                length: context.knobs.int.slider(
                    label: 'Pin Length', initialValue: 4, min: 4, max: 6),
                onComplete: (String value) {},
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

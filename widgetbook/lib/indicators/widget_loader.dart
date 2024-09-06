import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook/indicators/widget_loader.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CardExpandedLoader)
Widget defaultUseCase(BuildContext context) {
  final int itemCount =
      context.knobs.int.slider(label: 'Loader Count', initialValue: 3, max: 10);

  return Center(
    child: Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int j = 0; j < itemCount; j++)
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: CardExpandedLoader(
                  height: context.knobs.double
                      .input(label: 'Card Loader Height', initialValue: 50),
                ),
              )
          ],
        ),
      ),
    ),
  );
}
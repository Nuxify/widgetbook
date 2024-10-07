import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook_core/indicators/widget_loader.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CardLoader)
Widget defaultUseCase(BuildContext context) {
  final int itemCount =
      context.knobs.int.slider(label: 'Loader Count', initialValue: 4, max: 10);

  return Center(
    child: Container(
      color:
          !context.knobs.boolean(label: 'Dark background.', initialValue: true)
              ? const Color(0xFFF5F7F8)
              : const Color(0xFF1E201E),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: context.knobs.boolean(label: 'Grid Loader')
          ? Center(
              child: SizedBox(
                width: 300,
                height: 500,
                child: GridView.builder(
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    return CardLoader(
                      height: context.knobs.double.input(
                        label: 'Card Loader Height',
                        initialValue: 80,
                      ),
                      width: context.knobs.double.input(
                        label: 'Card Loader Width',
                        initialValue: 80,
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.9
                  ),
                ),
              ),
            )
          : Center(
              child: context.knobs
                      .boolean(label: 'Vertical Loader', initialValue: true)
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int j = 0; j < itemCount; j++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: CardLoader(
                              height: context.knobs.double.input(
                                  label: 'Card Loader Height',
                                  initialValue: 50),
                            ),
                          )
                      ],
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int j = 0; j < itemCount; j++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: CardLoader(
                              height: context.knobs.double.input(
                                label: 'Card Loader Height',
                                initialValue: 30,
                              ),
                              width: context.knobs.double.input(
                                label: 'Card Loader Width',
                                initialValue: 100,
                              ),
                            ),
                          )
                      ],
                    ),
            ),
    ),
  );
}

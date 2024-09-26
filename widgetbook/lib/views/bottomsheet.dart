import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook_core/views/bottomsheet.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: AppBottomsheet)
Widget defaultUseCase(BuildContext context) {
  final double height = MediaQuery.of(context).size.height;
  final double width = MediaQuery.of(context).size.width;
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      constraints: BoxConstraints(maxHeight: height * 0.6),
      width: width * 0.5,
      child: AppBottomsheet(
        leading:
            context.knobs.boolean(label: 'Display Leading', initialValue: true)
                ? Text(
                    context.knobs.string(
                      label: 'Leading Text',
                      initialValue: 'Close',
                    ),
                  )
                : null,
        trailing:
            context.knobs.boolean(label: 'Display Trailing', initialValue: true)
                ? const Icon(Icons.add)
                : null,
        title: context.knobs.boolean(
          label: 'Display Title',
          initialValue: true,
        )
            ? Text(
                context.knobs.string(
                  label: 'Title',
                  initialValue: 'Title Header',
                ),
                style: const TextStyle(
                  fontSize: 15,
                ),
              )
            : null,
        body: context.knobs
                .boolean(label: 'Display Body Content', initialValue: true)
            ? Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    const Text(
                      'Sample Text 1',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    const Icon(
                      Icons.favorite,
                      size: 40.0,
                      color: Colors.red,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60.0,
                      color: Colors.blueAccent,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    const Text(
                      'Sample Text 2',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    const Icon(
                      Icons.star,
                      size: 30.0,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      color: Colors.greenAccent,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    const Text(
                      'Sample Text 3',
                      style: TextStyle(fontSize: 22.0),
                    ),
                    const Icon(
                      Icons.thumb_up,
                      size: 50.0,
                      color: Colors.blue,
                    ),
                    Container(
                      width: double.infinity,
                      height: 70.0,
                      color: Colors.orangeAccent,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ],
                ),
              )
            : const Column(),
        isExpanded: context.knobs
            .boolean(label: 'Is Expanded Bottom Sheet', initialValue: false),
      ),
    ),
  );
}

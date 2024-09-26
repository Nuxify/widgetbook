// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'package:flutter/material.dart';
import 'package:mobile_scanner/src/objects/barcode_capture.dart';
import 'package:nuxify_widgetbook_qr_scanner/input/qr_scanner.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: QRScanner)
Widget defaultUseCase(BuildContext context) {
  return const Center(
    child: _QRScanner(),
  );
}

class _QRScanner extends StatefulWidget {
  const _QRScanner();

  @override
  State<_QRScanner> createState() => __QRScannerState();
}

class __QRScannerState extends State<_QRScanner> {
  String detectedValue = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 25),
          child: QRScanner(
            onDetect: (BarcodeCapture value) {
              if (value.barcodes.isNotEmpty) {
                setState(() {
                  detectedValue = value.barcodes.last.rawValue ?? '';
                });
              }
            },
            borderColor: context.knobs.color(
              label: 'Indicator Inactive Color',
              initialValue: Colors.orange,
            ),
          ),
        ),
        if (detectedValue.isNotEmpty)
          Text(
            'Detected value: $detectedValue',
            style: const TextStyle(
              color: Colors.white,
            ),
          )
      ],
    );
  }
}

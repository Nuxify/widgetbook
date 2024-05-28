import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:nuxify_widgetbook/input/qr_scanner.dart';
import 'package:nuxify_widgetbook/test/main_test.dart';

void main() {
  Future<void> widgetPumper(
    WidgetTester tester, {
    required void Function(BarcodeCapture)? onDetect,
    required Color borderColor,
    double borderWidth = 7,
  }) async =>
      tester.pumpWidget(
        universalPumper(
          Scaffold(
            body: QRScanner(
              onDetect: onDetect,
              borderColor: borderColor,
              borderWidth: borderWidth,
            ),
          ),
        ),
      );
  testWidgets('QRScanner renders correctly', (WidgetTester tester) async {
    // Build a MaterialApp with QRScanner inside for testing
    await widgetPumper(tester, onDetect: (_) {}, borderColor: Colors.white);
    await tester.pump();
    // Verify that the QRScanner is rendered
    expect(find.byType(QRScanner), findsOneWidget);
  });

  testWidgets('QRScanner renders color correctly', (WidgetTester tester) async {
    const Color borderColor = Colors.pink;
    // Build a MaterialApp with QRScanner inside for testing
    await widgetPumper(tester, onDetect: (_) {}, borderColor: borderColor);
    await tester.pump();
    // Verify that the QRScanner is rendered

    final QRScanner qrScanner =
        tester.widget<QRScanner>(find.byType(QRScanner));

    expect(qrScanner.borderColor, equals(borderColor));
  });
}

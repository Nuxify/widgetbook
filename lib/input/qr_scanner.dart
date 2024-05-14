import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanner extends StatelessWidget {
  /// It provides a visual representation of a QR code scanner with customizable border styling.
  ///
  ///
  /// [onDetect]  A required callback function that is triggered when a QR code is detected. It returns the captured barcode information.
  ///
  /// [borderColor] A required parameter specifying the color of the border surrounding the QR scanner.
  ///
  /// [borderWidth] An optional parameter specifying the width of the border. Default value is 7.
  const QRScanner({
    required this.onDetect,
    required this.borderColor,
    this.borderWidth = 7,
    super.key,
  });
  final double borderWidth;
  final Color borderColor;
  final void Function(BarcodeCapture)? onDetect;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: height * 0.02),
      height: width >= 1024 ? height * 0.24 : height * 0.36,
      width: width >= 1024 ? width * 0.35 : width,
      alignment: Alignment.center,
      child: CustomPaint(
        painter: _CameraCurvedFrame(
          borderColor: borderColor,
          borderWidth: borderWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: AspectRatio(
              aspectRatio: 1,
              child: MobileScanner(
                controller: MobileScannerController(
                  detectionSpeed: DetectionSpeed.normal,
                  autoStart: true,
                ),
                onDetect: onDetect,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CameraCurvedFrame extends CustomPainter {
  final double borderWidth;
  final Color borderColor;

  const _CameraCurvedFrame({
    required this.borderColor,
    this.borderWidth = 7,
  }) : assert(!(borderWidth < 7), 'Minimum border width should be 7');

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    final double height = size.height;
    final double width = size.width;

    final Path path = Path();

    /// First
    path.moveTo(width * 0.25, 0);
    path.lineTo(width * 0.1, 0);
    path.quadraticBezierTo(
      width * 0.010,
      height * 0.014,
      0,
      height * 0.1,
    );
    path.lineTo(0, height * 0.25);

    /// Second
    path.moveTo(width * 0.75, 0);
    path.lineTo(width * 0.9, 0);
    path.quadraticBezierTo(
      width * 0.984,
      height * 0.02,
      width,
      height * 0.1,
    );
    path.lineTo(width, height * 0.25);

    /// Third
    path.moveTo(0, height * 0.75);
    path.lineTo(0, height * 0.9);
    path.quadraticBezierTo(width * 0.005, height * 0.979, width * 0.09, height);
    path.lineTo(width * 0.25, height);

    /// Fourth
    path.moveTo(size.width, size.height * 0.75);
    path.lineTo(size.width, size.height * 0.9);
    path.quadraticBezierTo(
      width * 0.986,
      height * 0.98,
      width * 0.9,
      height,
    );
    path.lineTo(size.width * 0.75, size.height);

    // Draw the complete path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

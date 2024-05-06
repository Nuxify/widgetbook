import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanner extends StatelessWidget {
  const QRScanner({
    required this.onDetect,
    super.key,
  });
  final void Function(BarcodeCapture)? onDetect;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: height * 0.02),
      child: SizedBox(
        height: width >= 1024 ? height * 0.24 : height * 0.36,
        width: width >= 1024 ? width * 0.35 : width,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: AspectRatio(
                      aspectRatio: 1.01,
                      child: MobileScanner(
                        controller: MobileScannerController(
                          detectionSpeed: DetectionSpeed.normal,
                          autoStart: false,
                        ),
                        onDetect: onDetect,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SvgPicture.asset('assets/rectangle.svg'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook/indicators/horizontal_step_indicator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              HorizontalStepIndicator(
                length: 4,
                currentStep: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

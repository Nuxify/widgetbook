import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook/indicators/chip.dart';

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
              ChipIndicator(
                child: Text('hello'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

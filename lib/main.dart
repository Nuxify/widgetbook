import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook/layout/scaffold_layout.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldLayout(
      body: Column(
        children: [
          Text('Screen 1'),
        ],
      ),
    );
  }
}

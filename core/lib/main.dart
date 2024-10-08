import 'package:flutter/material.dart';
import 'package:nuxify_widgetbook_core/layout/dashboard_scaffold.dart';

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
    return const DashboardScaffold();
  }
}

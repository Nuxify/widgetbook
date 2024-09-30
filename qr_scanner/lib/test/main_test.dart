import 'package:flutter/material.dart';

Widget universalPumper(
  Widget child, {
  NavigatorObserver? observer,
}) {
  return MaterialApp(
    home: child,
    navigatorObservers: observer != null
        ? <NavigatorObserver>[observer]
        : <NavigatorObserver>[],
    debugShowCheckedModeBanner: false,
  );
}

Widget universalPumperWithRouteArguement(
  Widget child, {
  NavigatorObserver? observer,
  Object? arguements,
}) {
  return MaterialApp(
    navigatorObservers: observer != null
        ? <NavigatorObserver>[observer]
        : <NavigatorObserver>[],
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<dynamic>(
        settings: RouteSettings(
          arguments: arguements,
        ),
        builder: (_) => child,
      );
    },
    debugShowCheckedModeBanner: false,
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A custom status bar widget with configurable colors and brightness for status and navigation bars.
///
/// [backgroundColor] sets the background color of the AppBar.
///
/// [statusBarColor] changes the color of the status bar.
///
/// [statusBarIconBrightness] defines the brightness for status bar icons (light or dark).
///
/// [statusBarBrightness] sets the overall brightness of the status bar.
///
/// [systemNavigationBarIconBrightness] adjusts the brightness of the system navigation bar icons.
class AppStatusBar extends StatelessWidget implements PreferredSizeWidget {
  const AppStatusBar({
    this.backgroundColor,
    this.statusBarColor,
    this.statusBarIconBrightness = Brightness.dark,
    this.statusBarBrightness = Brightness.dark,
    this.systemNavigationBarIconBrightness = Brightness.dark,
    Key? key,
  }) : super(key: key);
  final Color? backgroundColor;
  final Color? statusBarColor;
  final Brightness? statusBarIconBrightness;
  final Brightness? statusBarBrightness;
  final Brightness? systemNavigationBarIconBrightness;

  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 0),
      child: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: backgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: statusBarIconBrightness,
          statusBarBrightness: statusBarBrightness,
          systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
          statusBarColor: statusBarColor,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A custom status bar widget with configurable colors and brightness for status and navigation bars.
///
/// [backgroundColor] sets the background color of the AppBar.
///
/// [statusBarColor] changes the color of the status bar.
///
/// [brightness] describes the contrast of a theme or color palette.
class AppStatusBar extends StatelessWidget implements PreferredSizeWidget {
  const AppStatusBar({
    required this.brightness,
    this.backgroundColor,
    this.statusBarColor,
    super.key,
  });
  final Color? backgroundColor;
  final Color? statusBarColor;
  final Brightness brightness;

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
          statusBarIconBrightness: brightness,
          statusBarBrightness: brightness,
          systemNavigationBarIconBrightness: brightness,
          statusBarColor: statusBarColor,
        ),
      ),
    );
  }
}

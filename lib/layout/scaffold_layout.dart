import 'package:flutter/material.dart';

class ScaffoldLayout extends StatefulWidget {
  const ScaffoldLayout({
    required this.body,
    super.key,
  });
  final Widget body;

  @override
  State<ScaffoldLayout> createState() => _ScaffoldLayoutState();
}

class _ScaffoldLayoutState extends State<ScaffoldLayout> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: '1'),
          BottomNavigationBarItem(
            icon: Icon(Icons.snapchat),
            label: '2',
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Container(
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: widget.body,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: width,
                height: height * 0.05,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

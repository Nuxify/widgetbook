import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.onPressed,
    required this.child,
    this.dense = false,
    this.isSuccessful = false,
    this.outlined = false,
    super.key,
  });
  final Widget child;
  final bool dense;
  final bool outlined;
  final bool isSuccessful;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    MaterialStateProperty<Color?>? backgroundColor() {
      if (isSuccessful) {
        return MaterialStateProperty.all(Colors.orange);
      } else if (!outlined) {
        return MaterialStateProperty.all(Colors.orange);
      }
      return null;
    }

    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: backgroundColor(),
        side: outlined == true
            ? MaterialStateProperty.all(
                const BorderSide(color: Colors.orange, width: 2),
              )
            : null,
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: dense ? 8 : 15,
            horizontal: dense ? 25 : 30,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      onPressed: onPressed,
      child:
          AnimatedSwitcher(duration: const Duration(seconds: 1), child: child),
    );
  }
}

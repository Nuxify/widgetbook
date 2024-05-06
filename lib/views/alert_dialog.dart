import 'package:flutter/material.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    required this.title,
    required this.bodyText,
    required this.actionButton,
    this.hasCancelButton = true,
    super.key,
  });
  final String title;
  final String bodyText;
  final Widget actionButton;
  final bool hasCancelButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      content: Text(
        bodyText,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
      ),
      actionsPadding: const EdgeInsets.only(top: 2, bottom: 12, right: 18),
      actions: <Widget>[
        if (hasCancelButton)
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Color(0xFF8D9297)),
            ),
          ),
        actionButton,
      ],
    );
  }
}

import 'package:flutter/material.dart';

/// The AppAlertDialog is a custom widget that displays an alert dialog with a title, body text, an action button, and an optional cancel button.
///
/// The dialog can be customized by passing the desired parameters when creating an instance of AppAlertDialog.
///
/// This widget is built using the Flutter framework and is designed to provide a more structured way to display alerts throughout your app with consistent design and behavior.
///
class AppAlertDialog extends StatelessWidget {
  /// [title] A String representing the title of the alert dialog. This should be concise
  ///
  /// [bodyText] A String containing the main message or content of the dialog.
  ///
  /// [actionButton] A Widget, typically a button that allows the user to take an action in response to the alert.
  ///
  /// [hasCancelButton] A bool that indicates if a cancel button should be included in the dialog.
  const AppAlertDialog({
    required this.title,
    required this.bodyText,
    required this.actionButton,
    this.surfaceTintColor = Colors.white,
    this.backgroundColor,
    this.hasCancelButton = true,
    super.key,
  });
  final String title;
  final String bodyText;
  final Widget actionButton;
  final bool hasCancelButton;
  final Color surfaceTintColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: surfaceTintColor,
      backgroundColor: backgroundColor,
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

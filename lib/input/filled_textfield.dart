import 'package:flutter/material.dart';

class FilledTextField extends StatelessWidget {
  /// Creates a text field with a filled appearance.
  ///
  /// Takes optional parameters that define the appearance and behavior of the text field.
  ///
  /// [controller] A TextEditingController that allows you to control the text being edited.
  ///
  /// [fillColor] The color to fill the text field with. If not provided, it defaults to a semi-transparent black color.
  ///
  /// [borderRadius] The radius of the border corners. Defaults to 30.
  ///
  /// [contentPadding] The padding around the text field content. Defaults to EdgeInsets.symmetric(vertical 10, horizontal 20).
  ///
  /// [validator] A function that takes the input text and returns an error string to display if the input is invalid.
  ///
  /// [hintText] The text to display when the text field is empty.
  ///
  /// [hintStyle] The style to apply to the hint text.
  ///
  /// [labelStyle] The style to apply to the label text.
  ///
  /// [labelText] The text to display as the label.
  ///
  /// [textStyle] The style to apply to the input text.
  ///
  /// [isDense] Whether the text field is dense, or not. Defaults to false.
  ///
  /// [obscureText] Whether to obscure the text being entered. Defaults to false.
  ///
  /// [floatingLabelBehavior] The behavior of the label when the text field is not empty. Defaults to FloatingLabelBehavior.always.
  ///
  /// [suffix] A widget to display after the text field.
  ///
  /// [prefix] A widget to display before the text field.
  ///
  /// [enabled] is an optional parameter that specifies whether the text field is enabled.
  const FilledTextField({
    this.controller,
    this.fillColor,
    this.borderRadius = 30,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 20,
    ),
    this.validator,
    this.hintText,
    this.hintStyle,
    this.labelStyle,
    this.labelText,
    this.textStyle,
    this.isDense = false,
    this.obscureText = false,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
    this.suffix,
    this.prefix,
    this.enabled = true,
    super.key,
  });
  final Color? fillColor;
  final Color errorBorderColor = Colors.redAccent;
  final double borderRadius;
  final EdgeInsetsGeometry contentPadding;
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final String? Function(String?)? validator;
  final bool isDense;
  final bool obscureText;
  final Widget? prefix;
  final Widget? suffix;
  final FloatingLabelBehavior floatingLabelBehavior;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      style: textStyle,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabled: enabled,
        prefixIcon: prefix,
        suffixIcon: suffix,
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        floatingLabelBehavior: floatingLabelBehavior,
        filled: true,
        isDense: isDense,
        fillColor: fillColor ?? Colors.black.withOpacity(0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: errorBorderColor, width: 1),
        ),
        contentPadding: contentPadding,
      ),
    );
  }
}

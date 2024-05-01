import 'package:flutter/material.dart';

class OutlinedTextField extends StatelessWidget {
  /// Creates a text field with an outlined appearance.
  ///
  /// Takes optional parameters that define the appearance and behavior of the text field.
  ///
  /// [controller] TextEditingController of the text field
  ///
  /// [borderRadius] The radius of the text field's border. Defaults to 30.
  ///
  /// [contentPadding] The padding inside the text field's content
  ///
  /// [validator] A function to validate the text field's input.
  ///
  /// [hintText] Hint text to show inside the textfield.
  ///
  /// [hintStyle] Style of the hintText
  ///
  /// [labelText] Floating label text
  ///
  /// [labelStyle] labelText style
  ///
  /// [textStyle] TextStyle of the textfield itself
  ///
  /// [isDense] a boolean that determines whether the text field is dense or not.
  const OutlinedTextField({
    this.controller,
    this.borderRadius = 30,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 20,
    ),
    this.validator,
    this.focusedBorderColor = Colors.black,
    this.borderColor = Colors.black26,
    this.errorBorderColor = Colors.redAccent,
    this.hintText,
    this.hintStyle,
    this.labelStyle,
    this.labelText,
    this.textStyle,
    this.isDense = false,
    this.obscureText = false,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
    this.prefix,
    this.suffix,
    super.key,
  });

  final Color borderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      style: textStyle,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        floatingLabelBehavior: floatingLabelBehavior,
        isDense: isDense,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: focusedBorderColor),
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

import 'package:flutter/material.dart';

class FilledTextField extends StatelessWidget {
  /// Creates a text field with a filled appearance.
  ///
  /// Takes optional parameters that define the appearance and behavior of the text field.
  ///
  /// [controller] TextEditingController of the text field
  ///
  /// [fillColor] The fill color of the text field. Defaults to black with 0.05 opacity.
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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      style: textStyle,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        floatingLabelBehavior: FloatingLabelBehavior.always,
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

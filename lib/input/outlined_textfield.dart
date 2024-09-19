import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OutlinedTextField extends StatelessWidget {
  /// Creates a text field with an outlined appearance.
  ///
  /// Takes optional parameters that define the appearance and behavior of the text field.
  ///
  /// [borderRadius] The radius of the border's corners.
  ///
  /// [contentPadding] The padding around the text field.
  ///
  /// [controller] The text editing controller for the text field.
  ///
  /// [validator] A function that validates the text input.
  ///
  /// [focusedBorderColor] The color of the border when the text field is focused.
  ///
  /// [borderColor] The color of the border.
  ///
  /// [errorBorderColor] The color of the border when there is an error.
  ///
  /// [hintText] The text to display when the text field is empty.
  ///
  /// [hintStyle] The style of the hint text.
  ///
  /// [labelText] The text to display as the label.
  ///
  /// [labelStyle] The style of the label text.
  ///
  /// [textStyle] The style of the input text.
  ///
  /// [isDense] Whether the text field is dense.
  ///
  /// [obscureText] Whether to obscure the input text.
  ///
  /// [floatingLabelBehavior] The behavior of the floating label.
  ///
  /// [prefix] A widget to display before the text field.
  ///
  /// [suffix] A widget to display after the text field.
  ///
  /// [enabled] is an optional parameter that specifies whether the text field is enabled.
  ///
  /// [maxLength] The maximum number of characters (Unicode scalar values) to allow in the text field.
  ///
  /// [maxLines] The maximum number of lines for the text to span, wrapping if necessary.
  ///
  /// [counterText] Optional custom counter text to be used instead of the default counter.
  ///
  /// [textInputAction] The action to perform when the user is done typing the text.
  ///
  /// [onFieldSubmitted] A callback that is called when the user is done typing the text.
  ///
  /// [inputFormatters] A list of input formatters to apply to the text field.
  ///
  /// [focusNode] The focus node for the text field.
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
    this.enabled = true,
    this.maxLength,
    this.maxLines,
    this.counterText,
    this.textInputAction,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.focusNode,
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
  final bool enabled;
  final int? maxLength;
  final int? maxLines;
  final String? counterText;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      style: textStyle,
      obscureText: obscureText,
      maxLength: maxLength,
      maxLines: maxLines,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      decoration: InputDecoration(
        enabled: enabled,
        counterText: counterText,
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

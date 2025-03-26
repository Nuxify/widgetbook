import 'package:flutter/services.dart';
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
  ///
  /// [maxLength] The maximum number of characters (Unicode scalar values) to allow in the text field.
  ///
  /// [maxLines] The maximum number of lines for the text to span, wrapping if necessary.
  ///
  /// [counterText] Optional custom counter text to be used instead of the default counter.
  ///
  /// [textInputAction] The action to perform when the user is done entering text.
  ///
  /// [onFieldSubmitted] A callback that is called when the user is done entering text.
  ///
  /// [inputFormatters] A list of TextInputFormatter objects that will be applied to the text field.
  ///
  /// [focusNode] A FocusNode that allows you to control the focus of the text field.
  ///
  /// [readOnly] Whether the text field is read-only.
  ///
  /// [onTap] A callback that is called when the text field is tapped.
  ///
  /// [keyboardType] Whether the keyboard layout uses num pad or alphabets
  ///
  /// [autovalidateMode] Determine if input user is valid according to set mode
  ///
  /// [textCapitalization] Text capitalization (apple / Apple)
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
    this.maxLength,
    this.maxLines,
    this.counterText,
    this.textInputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.inputFormatters,
    this.readOnly = false,
    this.keyboardType,
    this.autovalidateMode,
    this.onTap,
    this.textCapitalization = TextCapitalization.none,
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
  final int? maxLength;
  final int? maxLines;
  final String? counterText;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final bool readOnly;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onTap: onTap,
      focusNode: focusNode,
      validator: validator,
      controller: controller,
      style: textStyle,
      obscureText: obscureText,
      maxLength: maxLength,
      maxLines: maxLines,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      autovalidateMode: autovalidateMode,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        enabled: enabled,
        prefixIcon: prefix,
        counterText: counterText,
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

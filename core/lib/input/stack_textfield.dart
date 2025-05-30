import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StackTextField extends StatefulWidget {
  /// A customizable text input field that can be stacked with a label when text is entered.
  ///
  /// [hintText] is the text to display as a hint when the field is empty.
  ///
  /// [controller] is an optional [TextEditingController] to control the text field's text.
  ///
  /// [validator] is an optional function that validates the text input.
  ///
  /// [textInputAction] is an optional [TextInputAction] that specifies the action button to display on the keyboard.
  ///
  /// [inputFormatters] is an optional list of [TextInputFormatter]s that format and constrain the text input.
  ///
  /// [focusNode] is an optional [FocusNode] that manages the focus state of the text field.
  ///
  /// [onChanged] is an optional callback that is called when the text field's content changes.
  ///
  /// [label] is an optional label to be displayed above the text field when text is entered.
  ///
  /// [keyboardType] is an optional [TextInputType] that specifies the type of keyboard to use.
  ///
  /// [onTap] is an optional callback that is called when the text field is tapped.
  ///
  /// [readOnly] is an optional parameter that specifies whether the text field is read-only.
  ///
  /// [suffixIcon] is an optional widget to be displayed at the end of the text field.
  ///
  /// [scrollPadding] is an optional padding that insets the scrollable area to avoid the text field.
  ///
  /// [maxLines] is an optional parameter that specifies the maximum number of lines to allow in the text field.
  ///
  /// [autovalidateMode] is an optional parameter that controls when the text field should validate its content.
  ///
  /// [style] is an optional [TextStyle] to apply to the text field's text.
  ///
  /// [isDense] is an optional parameter that specifies whether the text field is visually dense.
  ///
  /// [prefixIcon] is an optional widget to be displayed at the start of the text field.
  ///
  /// [suffixText] is an optional text to be displayed after the text field.
  ///
  /// [suffixStyle] is an optional [TextStyle] to apply to the suffix text.
  ///
  /// [enabled] is an optional parameter that specifies whether the text field is enabled.
  ///
  /// [onFieldSubmitted] is an optional callback that is called when the text field's content is submitted.
  ///
  /// [textField] is an optional widget to replace the default text field.
  ///
  /// [obscuringText] is an optional parameter that specifies whether the text field obscures its text.
  ///
  /// [onEditingComplete] is an optional callback that is called when editing is complete.
  ///
  /// [onFocusChange] is an optional callback that is called when the focus state of the text field changes.
  ///
  /// [fillColor] is an optional color to fill the background of the text field.
  ///
  /// [labelColor] is an optional color to apply to the label text.
  const StackTextField({
    required this.hintText,
    this.controller,
    this.validator,
    this.textInputAction,
    this.inputFormatters,
    this.focusNode,
    this.onChanged,
    this.label,
    this.keyboardType,
    this.onTap,
    this.readOnly,
    this.suffixIcon,
    this.scrollPadding,
    this.maxLines,
    this.autovalidateMode,
    this.style,
    this.isDense,
    this.prefixIcon,
    this.suffixText,
    this.suffixStyle,
    this.onFieldSubmitted,
    this.enabled,
    this.textField,
    this.obscuringText = false,
    this.onEditingComplete,
    this.onFocusChange,
    this.fillColor,
    this.labelColor,
    super.key,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String hintText;
  final String? label;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool? readOnly;
  final Widget? suffixIcon;
  final EdgeInsets? scrollPadding;
  final int? maxLines;
  final AutovalidateMode? autovalidateMode;
  final TextStyle? style;
  final bool? isDense;
  final Widget? prefixIcon;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final bool? enabled;
  final void Function(String)? onFieldSubmitted;
  final Widget? textField;
  final bool obscuringText;
  final void Function()? onEditingComplete;
  final void Function(bool)? onFocusChange;
  final Color? fillColor;
  final Color? labelColor;

  @override
  State<StackTextField> createState() => _StackTextFieldState();
}

class _StackTextFieldState extends State<StackTextField> {
  late bool isEmpty = widget.controller?.text.isEmpty ?? true;

  @override
  void initState() {
    super.initState();

    widget.controller?.addListener(() {
      final String value = widget.controller?.text.trim() ?? '';
      setState(() {
        isEmpty = value.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Stack(
      children: <Widget>[
        Focus(
          canRequestFocus: false,
          onFocusChange: widget.onFocusChange,
          child: widget.textField ??
              TextFormField(
                onEditingComplete: widget.onEditingComplete,
                obscureText: widget.obscuringText,
                enabled: widget.enabled,
                controller: widget.controller,
                onFieldSubmitted: widget.onFieldSubmitted,
                onTap: widget.onTap,
                focusNode: widget.focusNode,
                validator: widget.validator,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: widget.fillColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: widget.labelColor ??
                        theme.colorScheme.primary.withValues(alpha: 0.7),
                  ),
                  suffixText: widget.suffixText,
                  prefixIcon: widget.prefixIcon,
                  isDense: widget.isDense,
                  suffixIcon: widget.suffixIcon,
                  suffixStyle: widget.suffixStyle,
                ),
                style: widget.style ?? const TextStyle(color: Colors.black),
                inputFormatters: widget.inputFormatters,
                textInputAction: widget.textInputAction,
                textAlignVertical: !isEmpty
                    ? TextAlignVertical.bottom
                    : TextAlignVertical.center,
                onChanged: widget.onChanged,
                keyboardType: widget.keyboardType,
                readOnly: widget.readOnly ?? false,
                scrollPadding:
                    widget.scrollPadding ?? const EdgeInsets.all(20.0),
                maxLines: widget.maxLines ?? 1,
                autovalidateMode: widget.autovalidateMode,
              ),
        ),
        if (!isEmpty)
          Positioned(
            key: const Key('stackLabel'),
            left: widget.prefixIcon != null ? 40.5 : 12.5,
            top: widget.textField != null ? 6 : 9,
            child: Text(
              widget.label ?? widget.hintText,
              style: TextStyle(
                fontSize: 10,
                color: widget.labelColor ??
                    theme.colorScheme.primary.withValues(alpha: 0.7),
              ),
            ),
          )
      ],
    );
  }
}

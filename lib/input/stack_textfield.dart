import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StackTextField extends StatefulWidget {
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
                        theme.colorScheme.primary.withOpacity(0.7),
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
                    theme.colorScheme.primary.withOpacity(0.7),
              ),
            ),
          )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class PincodeView extends StatefulWidget {
  /// Creates a PIN code input view.
  ///
  /// [length] The length of the PIN code to be entered.
  ///
  /// [onComplete] A callback function that gets called when the PIN code is complete.
  ///
  /// [keypadTextStyle] The text style for the keypad numbers.
  ///
  /// [indicatorColor] The color of the active indicator in the PIN code input.
  ///
  /// [indicatorInactiveColor] The color of the inactive indicators in the PIN code input.
  ///
  /// [label] The label to be displayed above the PIN code input.
  ///
  /// [logo] The logo to be displayed above the PIN code input.
  const PincodeView({
    required this.length,
    required this.onComplete,
    this.keypadTextStyle,
    this.indicatorColor = const Color(0xFF161D4B),
    this.indicatorInactiveColor = const Color(0xFFEDEDED),
    this.label,
    this.logo,
    super.key,
  });
  final Widget? logo;
  final Widget? label;
  final int length;
  final TextStyle? keypadTextStyle;
  final Color indicatorColor;
  final Color indicatorInactiveColor;
  final void Function(String value) onComplete;

  @override
  State<PincodeView> createState() => _PincodeViewState();
}

class _PincodeViewState extends State<PincodeView> {
  String pincode = '';

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.1),
              child: Column(
                children: [
                  widget.logo ?? const SizedBox.shrink(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.05),
                    child: widget.label,
                  ),
                  _Indicator(
                    index: pincode.length,
                    length: widget.length,
                    indicatorColor: widget.indicatorColor,
                    indicatorInactiveColor: widget.indicatorInactiveColor,
                  ),
                ],
              ),
            ),
          ),
          _Keypad(
            textStyle: widget.keypadTextStyle,
            input: (String value) {
              if (pincode.length < widget.length) {
                setState(() => pincode += value);
                if (pincode.length == widget.length) {
                  widget.onComplete.call(pincode);
                  return;
                }
              }
            },
            backspace: () {
              if (pincode.isNotEmpty) {
                setState(() {
                  pincode = pincode.substring(0, pincode.length - 1);
                });
              }
            },
          )
        ],
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({
    required this.index,
    required this.length,
    required this.indicatorColor,
    required this.indicatorInactiveColor,
  });
  final int index;
  final int length;
  final Color indicatorColor;
  final Color indicatorInactiveColor;

  @override
  Widget build(BuildContext context) {
    Widget indicator(int pincodeIndex) {
      return Padding(
        padding: const EdgeInsets.only(right: 18.0),
        child: CircleAvatar(
          backgroundColor:
              index <= pincodeIndex ? indicatorInactiveColor : indicatorColor,
          radius: 6,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[for (int i = 0; i < length; i++) indicator(i)],
    );
  }
}

class _Keypad extends StatelessWidget {
  const _Keypad({
    required this.input,
    required this.backspace,
    required this.textStyle,
  });
  final void Function(String value) input;
  final void Function() backspace;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    final List<List<String>> keypadMatrix = <List<String>>[
      <String>['1', '2', '3'],
      <String>['4', '5', '6'],
      <String>['7', '8', '9'],
      <String>['', '0', '-1'],
    ];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (int i = 0; i < 4; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int j = 0; j < 3; j++)
                  if (keypadMatrix[i][j].isEmpty)
                    const SizedBox(width: 80)
                  else if (keypadMatrix[i][j] == '-1')
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: IconButton(
                        onPressed: backspace,
                        icon: Icon(
                          Icons.backspace_outlined,
                          size: textStyle?.fontSize ?? 30,
                          color: textStyle?.color ?? Colors.black,
                        ),
                      ),
                    )
                  else
                    Material(
                      color: Theme.of(context).colorScheme.background,
                      child: InkWell(
                        onTap: () => input(keypadMatrix[i][j]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 5,
                          ),
                          child: Text(
                            keypadMatrix[i][j],
                            style: textStyle ??
                                Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
              ],
            ),
        ],
      ),
    );
  }
}

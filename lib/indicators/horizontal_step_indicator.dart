import 'package:flutter/material.dart';

class HorizontalStepIndicator extends StatelessWidget {
  /// Builds a row of horizontal step indicators.
  ///
  /// [length] The total number of steps in the row.
  ///
  /// [currentStep] The current step that is active.
  ///
  /// [activeColor] The color of the active step indicator. If not provided, it defaults to the primary color of the current theme.
  ///
  /// [inactiveColor] The color of the inactive step indicators. Defaults to grey.
  ///
  /// [stepPadding] The padding between each step indicator. Defaults to 8.
  ///
  /// [indicatorThickness] The thickness of each step indicator. Defaults to 2.
  ///
  /// [borderRadius] The border radius of each step indicator. Defaults to 0.
  const HorizontalStepIndicator({
    required this.length,
    required this.currentStep,
    this.activeColor,
    this.inactiveColor = Colors.grey,
    this.stepPadding = 8,
    this.indicatorThickness = 2,
    this.borderRadius = 0,
    super.key,
  });
  final int length;
  final int currentStep;
  final Color? activeColor;
  final Color inactiveColor;
  final double stepPadding;
  final double indicatorThickness;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < length; i++)
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: i == length - 1 ? 0 : stepPadding),
              child: Container(
                height: indicatorThickness,
                decoration: BoxDecoration(
                  color: i < currentStep
                      ? activeColor ?? Theme.of(context).primaryColor
                      : inactiveColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
          )
      ],
    );
  }
}

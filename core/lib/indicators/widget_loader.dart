import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// These are the static widgets that we're gonna use as skeleton loaders.
/// We use the Text Widget with dummy values to emulate the the exact dimensions of specific widgets
/// The text values won't show up because they are overlapped by the shimmer effect. It's just for height and width purposes.

const Duration fadeInDuration = Duration(milliseconds: 500);

class CardExpandedLoader extends StatelessWidget {
  const CardExpandedLoader({
    required this.height,
    this.baseColor = const Color(0xFF607D8B),
    this.highlightColor = const Color(0xFFCFD8DC),
    super.key,
  });
  final double height;
  final Color baseColor;
  final Color highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: baseColor.withOpacity(0.1),
        ),
        margin: const EdgeInsets.only(right: 8),
        height: height,
      ),
    );
  }
}

class CardLoader extends StatelessWidget {
  const CardLoader({
    required this.height,
    required this.width,
    this.baseColor = const Color(0xFF607D8B),
    this.highlightColor = const Color(0xFFCFD8DC),
    super.key,
  });
  final double height;
  final double width;
  final Color baseColor;
  final Color highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: baseColor.withOpacity(0.1),
        ),
        margin: const EdgeInsets.only(right: 8),
        height: height,
        width: width,
      ),
    );
  }
}

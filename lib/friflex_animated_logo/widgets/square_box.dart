import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/widgets/rrect_blurred_box.dart';

class SquareBox extends StatelessWidget {
  const SquareBox({
    Key? key,
    required this.squareSide,
    this.color = Colors.white,
    this.borderRadius = 0,
    this.blurValue = 0,
  }) : super(key: key);

  final double squareSide;
  final Color color;
  final double borderRadius;
  final double blurValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: squareSide,
      child: RRectBlurredBox(
        color: color,
        borderRadius: borderRadius,
        blurValue: blurValue,
      ),
    );
  }
}

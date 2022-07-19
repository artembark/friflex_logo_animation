import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class RectangleSmall extends StatelessWidget {
  const RectangleSmall({
    Key? key,
    required this.blurValue,
    required this.size,
    required this.borderRadius,
    required this.color,
    required this.offset,
  }) : super(key: key);

  static const rotation = pi / 4;
  static const blurOversize = 1.1;
  static const blurThreshold = 0.001;

  final Color color;
  final double size;
  final Offset offset;
  final double borderRadius;
  final double blurValue;

  @override
  Widget build(BuildContext context) {
    final bool isBlur = blurValue > blurThreshold;
    return Transform.translate(
      offset: offset,
      child: Transform.rotate(
        angle: rotation,
        child: SizedBox(
          height: size * blurOversize,
          width: size * blurOversize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: color),
              ),
              if (isBlur)
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: blurValue,
                      sigmaY: blurValue,
                    ),
                    child: Container(
                      height: size * blurOversize,
                      width: size * blurOversize,
                      color: Colors.black.withOpacity(0),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'rectangle_part_painter.dart';

class RectanglePart extends StatelessWidget {
  const RectanglePart({
    Key? key,
    required this.size,
    required this.blurValue,
    required this.borderRadius,
    required this.color,
  }) : super(key: key);

  static const rotation = pi / 4;
  static const blurOversize = 1.1;
  static const blurThreshold = 0.001;

  final Color color;
  final double size;
  final double borderRadius;
  final double blurValue;

  @override
  Widget build(BuildContext context) {
    final bool isBlur = blurValue > blurThreshold;
    return Transform.rotate(
      angle: rotation,
      child: SizedBox(
        height: size * blurOversize,
        width: size * blurOversize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: size,
              width: size,
              child: CustomPaint(
                painter: RectanglePartPainter(
                    borderRadius: borderRadius, color: color),
              ),
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
              ),
          ],
        ),
      ),
    );
  }
}

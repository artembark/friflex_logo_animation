import 'package:flutter/material.dart';

class RectanglePartPainter extends CustomPainter {
  final double borderRadius;
  final Color color;

  RectanglePartPainter({required this.color, required this.borderRadius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()
          ..addRRect(RRect.fromLTRBR(
              0, 0, size.width, size.height, Radius.circular(borderRadius))),
        Path()
          ..addRRect(RRect.fromLTRBAndCorners(
              0, size.height * 0.3, size.width * 0.7, size.height,
              topRight: Radius.circular(borderRadius))),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

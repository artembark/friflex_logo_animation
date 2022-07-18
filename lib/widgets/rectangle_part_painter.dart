import 'package:flutter/material.dart';

class RectanglePartPainter extends CustomPainter {
  ///Квадрат с квадратным вырезом с одного из углов
  ///Для рисования необходим радиус угла [borderRadius]
  ///и цвет заливки [color]
  RectanglePartPainter({required this.color, required this.borderRadius});

  final double borderRadius;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color;

    canvas.saveLayer(Rect.fromLTRB(0, 0, size.width, size.height), paint);
    canvas.drawRRect(
        RRect.fromLTRBR(
            0, 0, size.width, size.height, Radius.circular(borderRadius)),
        paint);
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(
            -1, size.height * 0.3, size.width * 0.7, size.height + 1,
            topRight: Radius.circular(borderRadius)),
        paint..blendMode = BlendMode.dstOut);
    canvas.restore();

    //not working with html renderer on mobile web browsers
    // canvas.drawRRect(
    //     RRect.fromLTRBR(
    //         0, 0, size.width, size.height, Radius.circular(borderRadius)),
    //     paint);

    // canvas.drawPath(
    //   Path.combine(
    //     PathOperation.difference,
    //     Path()
    //       ..addRRect(RRect.fromLTRBR(
    //           0, 0, size.width, size.height, Radius.circular(borderRadius))),
    //     Path()
    //       ..addRRect(RRect.fromLTRBAndCorners(
    //           0, size.height * 0.3, size.width * 0.7, size.height,
    //           topRight: Radius.circular(borderRadius))),
    //   ),
    //   paint,
    // );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

import 'package:flutter/material.dart';

class FriflexLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint border = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    Paint body = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    double width = size.width;
    double height = size.height;

    final Path heartLineArc = Path()
      ..moveTo(width * 0.0, height * 1.0)
      ..lineTo(width * 0.0, height * (1.0 - 110 / 132))
      ..arcToPoint(Offset(width * 22 / 87, (1.0 - 110 / 132)),
          radius: Radius.circular(width * 0.25))
      ..lineTo(width * 81 / 87, height * 0)
      ..arcToPoint(Offset(width, height * (1.0 - 127 / 132)),
          radius: Radius.circular(width * 0.06))
      ..lineTo(width * 1.0, height * 17 / 132)
      ..arcToPoint(Offset(width * 81 / 87, height * 22 / 132),
          radius: Radius.circular(width * 0.06))
      ..lineTo(width * 22 / 87, height * 22 / 132)
      ..lineTo(width * 22 / 87, height * 56 / 132)
      ..lineTo(width * 65 / 87, height * 56 / 132)
      ..lineTo(width * 65 / 87, height * 77 / 132)
      ..lineTo(width * 22 / 87, height * 77 / 132)
      ..lineTo(width * 22 / 87, height * 1.0)
      ..lineTo(width * 0.0, height * 1.0);

    // final Path heartLineArc = Path()
    //   ..moveTo(0, height)
    //   ..lineTo(0, 0)
    //   ..arcToPoint(Offset(0.5 * width, height * 0.12),
    //       radius: Radius.circular(1))
    //   ..moveTo(0.5 * width, height)
    //   ..lineTo(width * 0.94, height * 0.45)
    //   ..arcToPoint(Offset(0.5 * width, height * 0.12),
    //       radius: Radius.circular(1), clockwise: false);

    //вариант более гладкого сердечка
    final Path heartCubic = Path()
      ..moveTo(0.5 * width, height)
      ..cubicTo(-0.45 * width, height * 0.5, 0.2 * width, height * -0.4,
          0.5 * width, height * 0.3)
      ..moveTo(0.5 * width, height)
      ..cubicTo(1.45 * width, height * 0.5, 0.8 * width, height * -0.4,
          0.5 * width, height * 0.3);

    canvas
      //..drawPath(heartLineArc, body)
      ..drawPath(heartLineArc, border);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/utils/logo_const.dart';

class SquarePartPainter extends CustomPainter {
  ///Квадрат с квадратным вырезом с одного из углов
  ///Для рисования необходим радиус угла [borderRadius]
  ///и цвет заливки [color]
  SquarePartPainter({
    required this.borderRadius,
    required this.blurValue,
  });

  final double borderRadius;
  final double blurValue;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = LogoConst.squareColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurValue);

    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(45 * pi / 180);
    canvas.translate(-size.width / 2, -size.height / 2);

    //для того, чтобы получить прозрачный вырез
    canvas.saveLayer(Rect.fromLTRB(0, 0, size.width, size.height), paint);

    //рисуем квадрат
    canvas.drawRRect(
        RRect.fromLTRBR(
            0, 0, size.width, size.height, Radius.circular(borderRadius)),
        paint);
    //рисуем вырез в режиме BlendMode.dstOut
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(
            -2, size.height * 0.3, size.width * 0.7, size.height + 2,
            topRight: Radius.circular(borderRadius)),
        paint..blendMode = BlendMode.dstOut);
    //делаем restore для получения комбинирования нарисованных объектов
    // с учетом blendMode
    canvas.restore();

    //не работает с html рендерером в мобильных браузерах
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

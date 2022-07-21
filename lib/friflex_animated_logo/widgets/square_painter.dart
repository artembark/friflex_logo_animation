import 'dart:math';

import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/utils/logo_const.dart';

class SquarePainter extends CustomPainter {
  ///Не используется, заменен на отрисовку через RenderObject
  ///Оставлен для примера
  ///Квадрат с параметром размытия
  ///Для рисования необходим радиус угла [borderRadius]
  ///и цвет заливки [color]
  SquarePainter({required this.borderRadius, required this.blurValue});

  final double borderRadius;
  final double blurValue;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = LogoConst.squareColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurValue);

    //смещение и поворот canvas
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(45 * pi / 180);
    canvas.translate(-size.width / 2, -size.height / 2);

    //рисование квадрата с углами
    canvas.drawRRect(
        RRect.fromLTRBR(
            0, 0, size.width, size.height, Radius.circular(borderRadius)),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

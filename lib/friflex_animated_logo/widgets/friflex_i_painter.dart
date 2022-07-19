import 'dart:math';

import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/utils/logo_const.dart';

class FriflexIPainter extends CustomPainter {
  final double iDotYPosition;
  final double iDotOpacity;
  final double iDotRotation;
  final double iRectHeight;

  FriflexIPainter({
    required this.iDotOpacity,
    required this.iDotRotation,
    required this.iDotYPosition,
    required this.iRectHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // рисование символ i нижняя часть
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(
          size.width * 249 / 762,
          size.height * (205 - 135) / 205 * iRectHeight,
          size.width * 282 / 762,
          size.height,
          topLeft: Radius.circular(size.width * 0.01),
          topRight: Radius.circular(size.width * 0.01),
        ),
        Paint()
          ..color = LogoConst.textColor
          ..style = PaintingStyle.fill);

    // расчеты символ i точка
    final iPointSymbolScale = (iDotYPosition + 4) * 0.25;
    final radius = size.width * ((282 - 249) / 2 / 762);
    final diagonal = radius - 1 / 2 * radius * (sqrt(2.0) - 1);

    //смещение точки по вертикали
    canvas.translate(
        0,
        iDotYPosition * ((size.height * (205 - 135) / 205)) -
            diagonal * iPointSymbolScale);

    //смещние и поворот canvas для анимации вращения ромба
    canvas.translate(size.width * (249 + (282 - 249) / 2) / 762, 0);
    canvas.rotate(45 * pi / 180 * iDotRotation);
    canvas.translate(-size.width * (249 + (282 - 249) / 2) / 762, 0);

    //рисование ромба
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCircle(
            center: Offset(size.width * (249 + (282 - 249) / 2) / 762, 0),
            radius: diagonal * iPointSymbolScale,
          ),
          Radius.circular(size.width * 0.012),
        ),
        Paint()
          ..color = LogoConst.squareColor.withOpacity(iDotOpacity)
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

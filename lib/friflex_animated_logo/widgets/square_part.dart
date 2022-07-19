import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/utils/logo_const.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/widgets/square_blur_overlay.dart';

import 'square_part_painter.dart';

class SquarePart extends StatelessWidget {
  ///Квадрат с квадратным вырезом с одного из углов
  ///Для рисования необходим размер стороны [size],
  ///радиус угла [borderRadius], цвет заливки [color],
  ///смещение [offset]
  const SquarePart({
    Key? key,
    required this.size,
    required this.blurValue,
    required this.borderRadius,
    required this.offset,
  }) : super(key: key);

  final double size;
  final Offset offset;
  final double borderRadius;
  final double blurValue;

  @override
  Widget build(BuildContext context) {
    final bool isBlur = blurValue > LogoConst.blurThreshold;
    return Transform.translate(
      offset: offset,
      child: Transform.rotate(
        angle: LogoConst.squareRotation,
        child: SizedBox(
          height: size * LogoConst.blurOversize,
          width: size * LogoConst.blurOversize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: size,
                width: size,
                child: CustomPaint(
                  painter: SquarePartPainter(
                      borderRadius: borderRadius, color: LogoConst.squareColor),
                ),
              ),
              if (isBlur) SquareBlurOverlay(blurValue: blurValue, size: size)
            ],
          ),
        ),
      ),
    );
  }
}

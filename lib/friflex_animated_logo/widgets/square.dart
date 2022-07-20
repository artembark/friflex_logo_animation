import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/widgets/square_painter.dart';

class Square extends StatelessWidget {
  ///Залитый цветом размываемый ромб. Для создания требует
  ///размер сторон [size], радиус углов [borderRadius],
  ///размытие [blurValue], смещение [offset]
  const Square({
    Key? key,
    required this.blurValue,
    required this.size,
    required this.borderRadius,
    required this.offset,
  }) : super(key: key);

  final double size;
  final Offset offset;
  final double borderRadius;
  final double blurValue;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: SizedBox(
        height: size,
        width: size,
        child: CustomPaint(
          painter:
              SquarePainter(borderRadius: borderRadius, blurValue: blurValue),
        ),
      ),
    );
  }
}

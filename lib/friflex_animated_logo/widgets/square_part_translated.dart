import 'package:flutter/material.dart';

import 'square_part_painter.dart';

class SquarePartTranslated extends StatelessWidget {
  ///Квадрат с квадратным вырезом с одного из углов
  ///Для рисования необходим размер стороны [size],
  ///радиус угла [borderRadius], цвет заливки [color],
  ///смещение [offset]
  const SquarePartTranslated({
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
    return Transform.translate(
      offset: offset,
      child: CustomPaint(
        size: Size(size, size),
        painter:
            SquarePartPainter(borderRadius: borderRadius, blurValue: blurValue),
      ),
    );
  }
}

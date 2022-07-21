import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/utils/logo_const.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/widgets/square_box.dart';

class SquareTranslated extends StatelessWidget {
  ///Залитый цветом размываемый ромб. Для создания требует
  ///размер сторон [size], радиус углов [borderRadius],
  ///размытие [blurValue], смещение [offset]
  const SquareTranslated({
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
      child: SquareBox(
        squareSide: size,
        color: LogoConst.squareColor,
        borderRadius: borderRadius,
        blurValue: blurValue,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/utils/logo_const.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/widgets/rectangle_blur_overlay.dart';

class RectangleSmall extends StatelessWidget {
  const RectangleSmall({
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
    final bool isBlur = blurValue > LogoConst.blurThreshold;
    return Transform.translate(
      offset: offset,
      child: Transform.rotate(
        angle: LogoConst.rectRotation,
        child: SizedBox(
          height: size * LogoConst.blurOversize,
          width: size * LogoConst.blurOversize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: LogoConst.rectColor),
              ),
              if (isBlur) RectangleBlurOverlay(blurValue: blurValue, size: size)
            ],
          ),
        ),
      ),
    );
  }
}

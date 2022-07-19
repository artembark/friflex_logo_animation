import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/utils/logo_const.dart';

class RectangleBlurOverlay extends StatelessWidget {
  const RectangleBlurOverlay({
    Key? key,
    required this.blurValue,
    required this.size,
  }) : super(key: key);

  final double blurValue;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blurValue,
          sigmaY: blurValue,
        ),
        child: Container(
          height: size * LogoConst.blurOversize,
          width: size * LogoConst.blurOversize,
          color: Colors.black.withOpacity(0),
        ),
      ),
    );
  }
}

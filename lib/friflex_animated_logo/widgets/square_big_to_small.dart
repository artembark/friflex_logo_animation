import 'dart:math';

import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/animations/custom_curves.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/utils/logo_const.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/animations/logo_animation.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/widgets/square_box.dart';

import 'square_glow.dart';

class SquareBigToSmall extends StatefulWidget {
  ///Виджет анимации появления с вращением большого ромба и его уменьшения
  const SquareBigToSmall({
    Key? key,
    required this.introController,
    required this.transformController,
    required this.smallSquareSide,
    required this.squareBorderRadius,
  }) : super(key: key);

  final AnimationController introController;
  final AnimationController transformController;
  final double smallSquareSide;
  final double squareBorderRadius;

  @override
  State<SquareBigToSmall> createState() => _SquareBigToSmallState();
}

class _SquareBigToSmallState extends State<SquareBigToSmall> {
  late Animation _introScaleAnimation;
  late Animation _introRotationAnimation;
  late Animation _step1BlurAnimation;
  late Animation _step2BlurAnimation;
  late Animation _step2ScaleAnimation;

  @override
  void initState() {
    super.initState();
    _introScaleAnimation = LogoAnimation().intervalTween(
      controller: widget.introController,
      curve: Curves.elasticOut,
      tweenBegin: 0.5,
      tweenEnd: 1.0,
      intervalBegin: 0.0,
      intervalEnd: 0.5,
    );
    _introRotationAnimation = LogoAnimation().intervalTween(
      controller: widget.introController,
      curve: const EaseOutBackCustomCurve(),
      tweenBegin: -2.0 * pi,
      tweenEnd: 0,
      intervalBegin: 0.0,
      intervalEnd: 0.5,
    );
    _step1BlurAnimation = LogoAnimation().squareBlurAnimation(
      controller: widget.transformController,
      begin: 0.0,
      end: 0.2,
    );
    _step2ScaleAnimation = LogoAnimation().intervalTween(
      controller: widget.transformController,
      curve: Curves.easeIn,
      tweenBegin: LogoConst.smallSquareScale,
      tweenEnd: 1.0,
      intervalBegin: 0.2,
      intervalEnd: 0.4,
    );
    _step2BlurAnimation = LogoAnimation().squareBlurAnimation(
      controller: widget.transformController,
      begin: 0.2,
      end: 0.4,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _step2ScaleAnimation.value * _introScaleAnimation.value,
      child: Transform.rotate(
        angle: _introRotationAnimation.value,
        child: SquareGlow(
          controller: widget.introController,
          color: LogoConst.squareColor,
          size: widget.smallSquareSide,
          scaleFactor: 1.8,
          borderRadius: widget.squareBorderRadius,
          child: SquareBox(
            squareSide: widget.smallSquareSide,
            color: LogoConst.squareColor,
            borderRadius: widget.squareBorderRadius,
            blurValue: _step1BlurAnimation.value + _step2BlurAnimation.value,
          ),
        ),
      ),
    );
  }
}

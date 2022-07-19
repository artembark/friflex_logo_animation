import 'dart:math';

import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/utils/logo_const.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/animations/logo_animation.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/widgets/square_blur_overlay.dart';

import 'square_glow.dart';

class SquareBigToSmall extends StatefulWidget {
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
  late Animation _introRotationAnimation;
  late Animation _step1BlurAnimation;
  late Animation _step2BlurAnimation;
  late Animation _step2ScaleAnimation;

  @override
  void initState() {
    super.initState();
    _introRotationAnimation = Tween<double>(begin: -2 * pi, end: 0.0)
        .chain(CurveTween(curve: Curves.easeOutBack))
        .animate(
          CurvedAnimation(
            parent: widget.introController,
            curve: const Interval(
              0.0,
              0.5,
            ),
          ),
        );
    _step1BlurAnimation = LogoAnimation().squareBlurAnimation(
        controller: widget.transformController, begin: 0.0, end: 0.2);
    _step2ScaleAnimation =
        Tween<double>(begin: LogoConst.smallSquareScale, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.transformController,
        curve: const Interval(
          0.2,
          0.4,
          curve: Curves.easeIn,
        ),
      ),
    );
    _step2BlurAnimation = LogoAnimation().squareBlurAnimation(
        controller: widget.transformController, begin: 0.2, end: 0.4);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _step2ScaleAnimation.value,
      child: Transform.rotate(
        angle: LogoConst.squareRotation + _introRotationAnimation.value,
        child: SizedBox(
          height: widget.smallSquareSide * LogoConst.blurOversize,
          width: widget.smallSquareSide * LogoConst.blurOversize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SquareGlow(
                controller: widget.introController,
                color: LogoConst.squareColor,
                size: widget.smallSquareSide,
                scaleFactor: 1.8,
                borderRadius: widget.squareBorderRadius,
                child: Container(
                  height: widget.smallSquareSide,
                  width: widget.smallSquareSide,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      widget.squareBorderRadius,
                    ),
                    color: LogoConst.squareColor,
                  ),
                ),
              ),
              if (_step1BlurAnimation.value > LogoConst.blurThreshold)
                SquareBlurOverlay(
                  blurValue: _step1BlurAnimation.value,
                  size: widget.smallSquareSide,
                ),
              if (_step2BlurAnimation.value > LogoConst.blurThreshold)
                SquareBlurOverlay(
                  blurValue: _step2BlurAnimation.value,
                  size: widget.smallSquareSide,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/utils/logo_const.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/animations/logo_animation.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/widgets/rectangle_blur_overlay.dart';

import 'rectangle_glow.dart';

class BigToSmallRectangle extends StatefulWidget {
  const BigToSmallRectangle({
    Key? key,
    required this.introController,
    required this.transformController,
    required this.smallSquareSide,
    required this.rectBorderRadius,
  }) : super(key: key);

  final AnimationController introController;
  final AnimationController transformController;
  final double smallSquareSide;
  final double rectBorderRadius;

  @override
  State<BigToSmallRectangle> createState() => _BigToSmallRectangleState();
}

class _BigToSmallRectangleState extends State<BigToSmallRectangle> {
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
    _step1BlurAnimation = LogoAnimation().rectBlurAnimation(
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
    _step2BlurAnimation = LogoAnimation().rectBlurAnimation(
        controller: widget.transformController, begin: 0.2, end: 0.4);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _step2ScaleAnimation.value,
      child: Transform.rotate(
        angle: pi / 4 + _introRotationAnimation.value,
        child: SizedBox(
          height: widget.smallSquareSide * LogoConst.blurOversize,
          width: widget.smallSquareSide * LogoConst.blurOversize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              RectangleGlow(
                introController: widget.introController,
                color: LogoConst.rectColor,
                size: widget.smallSquareSide,
                borderRadius: widget.rectBorderRadius,
                child: Container(
                  height: widget.smallSquareSide,
                  width: widget.smallSquareSide,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      widget.rectBorderRadius,
                    ),
                    color: LogoConst.rectColor,
                  ),
                ),
              ),
              if (_step1BlurAnimation.value > LogoConst.blurThreshold)
                RectangleBlurOverlay(
                  blurValue: _step1BlurAnimation.value,
                  size: widget.smallSquareSide,
                ),
              if (_step2BlurAnimation.value > LogoConst.blurThreshold)
                RectangleBlurOverlay(
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

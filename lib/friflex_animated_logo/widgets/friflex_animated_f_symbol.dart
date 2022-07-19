import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/animations/logo_animation.dart';

import 'rectangle_big_to_small.dart';
import 'rectangle_part.dart';
import 'rectangle_small.dart';

class FriflexAnimatedFSymbol extends StatefulWidget {
  const FriflexAnimatedFSymbol({
    Key? key,
    required this.introController,
    required this.transformController,
    required this.bigSquareDiagonal,
    required this.horizontalDiagonalOffset,
    required this.halfBigSquareSide,
    required this.smallSquareSide,
    required this.rectBorderRadius,
  }) : super(key: key);

  final AnimationController introController;
  final AnimationController transformController;

  final double bigSquareDiagonal;
  final double horizontalDiagonalOffset;
  final double halfBigSquareSide;
  final double smallSquareSide;
  final double rectBorderRadius;

  @override
  State<FriflexAnimatedFSymbol> createState() => _FriflexAnimatedFSymbolState();
}

class _FriflexAnimatedFSymbolState extends State<FriflexAnimatedFSymbol> {
  late Animation _introScaleAnimation;
  late Animation _step3PositionAnimation;
  late Animation _step3BlurAnimation;
  late Animation _step4PositionAnimation;
  late Animation _step4BlurAnimation;
  late Animation _step5PositionAnimation;
  late Animation _step5BlurAnimation;

  @override
  void initState() {
    super.initState();
    _introScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.introController,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.elasticOut,
        ),
      ),
    );

    _step3PositionAnimation = LogoAnimation().smallRectPositionAnimation(
        controller: widget.transformController, begin: 0.4, end: 0.6);
    _step3BlurAnimation = LogoAnimation().rectBlurAnimation(
        controller: widget.transformController, begin: 0.4, end: 0.6);
    _step4PositionAnimation = LogoAnimation().smallRectPositionAnimation(
        controller: widget.transformController, begin: 0.6, end: 0.8);
    _step4BlurAnimation = LogoAnimation().rectBlurAnimation(
        controller: widget.transformController, begin: 0.6, end: 0.8);
    _step5PositionAnimation = LogoAnimation().smallRectPositionAnimation(
        controller: widget.transformController, begin: 0.8, end: 1.0);
    _step5BlurAnimation = LogoAnimation().rectBlurAnimation(
        controller: widget.transformController, begin: 0.8, end: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _introScaleAnimation.value,
      child: SizedBox(
        height: widget.bigSquareDiagonal,
        width: widget.bigSquareDiagonal,
        child: Stack(
          alignment: Alignment.center,
          children: [
            //правый верхний
            if (_step5PositionAnimation.value > 0)
              RectanglePart(
                size: widget.smallSquareSide,
                offset: Offset(
                    widget.horizontalDiagonalOffset *
                        (_step4PositionAnimation.value +
                            _step5PositionAnimation.value),
                    -widget.halfBigSquareSide * _step3PositionAnimation.value),
                borderRadius: widget.rectBorderRadius,
                blurValue: _step5BlurAnimation.value,
              ),
            //центральный верхний
            if (_step4PositionAnimation.value > 0)
              RectanglePart(
                size: widget.smallSquareSide,
                offset: Offset(
                    widget.horizontalDiagonalOffset *
                        _step4PositionAnimation.value,
                    -widget.halfBigSquareSide * _step3PositionAnimation.value),
                borderRadius: widget.rectBorderRadius,
                blurValue: _step4BlurAnimation.value,
              ),
            if (_step4PositionAnimation.value > 0)
              RectanglePart(
                size: widget.smallSquareSide,
                offset: Offset(
                    widget.horizontalDiagonalOffset *
                        _step4PositionAnimation.value,
                    0),
                borderRadius: widget.rectBorderRadius,
                blurValue: _step4BlurAnimation.value,
              ),
            //левый верхний
            if (_step3PositionAnimation.value > 0)
              RectangleSmall(
                size: widget.smallSquareSide,
                offset: Offset(
                  0,
                  -widget.halfBigSquareSide * _step3PositionAnimation.value,
                ),
                borderRadius: widget.rectBorderRadius,
                blurValue: _step3BlurAnimation.value,
              ),
            //левый нижний
            if (_step3PositionAnimation.value > 0)
              RectangleSmall(
                size: widget.smallSquareSide,
                offset: Offset(
                  0,
                  widget.halfBigSquareSide * _step3PositionAnimation.value,
                ),
                borderRadius: widget.rectBorderRadius,
                blurValue: _step3BlurAnimation.value,
              ),
            //большой переходящий в левый центральный
            BigToSmallRectangle(
              introController: widget.introController,
              transformController: widget.transformController,
              smallSquareSide: widget.smallSquareSide,
              rectBorderRadius: widget.rectBorderRadius,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
    required this.rectColor,
    required this.smallSquareSide,
    required this.rectBorderRadius,
    required this.smallSquareScale,
  }) : super(key: key);

  final AnimationController introController;
  final AnimationController transformController;

  final double bigSquareDiagonal;
  final double horizontalDiagonalOffset;
  final double halfBigSquareSide;
  final double smallSquareScale;
  final Color rectColor;
  final double smallSquareSide;
  final double rectBorderRadius;

  @override
  State<FriflexAnimatedFSymbol> createState() => _FriflexAnimatedFSymbolState();
}

class _FriflexAnimatedFSymbolState extends State<FriflexAnimatedFSymbol> {
  static const startBlur = 0.0;
  static const finalBlur = 0.15;
  static const blurOversize = 1.1;

  //для Flutter Web, т.к. в нем нельзя устанавливать значение 0
  //в blur sigmaX или sigmaY, открытая issue
  //https://github.com/flutter/flutter/issues/89433
  static const blurThreshold = 0.001;

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

    _step3PositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.transformController,
        curve: const Interval(
          0.4,
          0.6,
          curve: Curves.easeIn,
        ),
      ),
    );
    _step3BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: startBlur, end: finalBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(finalBlur), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: finalBlur, end: startBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: widget.transformController,
        curve: const Interval(
          0.4,
          0.6,
        ),
      ),
    );
    _step4PositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.transformController,
        curve: const Interval(
          0.6,
          0.8,
          curve: Curves.easeIn,
        ),
      ),
    );
    _step4BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: startBlur, end: finalBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(finalBlur), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: finalBlur, end: startBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: widget.transformController,
        curve: const Interval(
          0.6,
          0.8,
        ),
      ),
    );
    _step5PositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.transformController,
        curve: const Interval(
          0.8,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    _step5BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: startBlur, end: finalBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(finalBlur), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: finalBlur, end: startBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: widget.transformController,
        curve: const Interval(
          0.8,
          1.0,
        ),
      ),
    );
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
                color: widget.rectColor,
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
                color: widget.rectColor,
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
                color: widget.rectColor,
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
                color: widget.rectColor,
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
                color: widget.rectColor,
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
              blurOversize: blurOversize,
              blurThreshold: blurThreshold,
              startBlur: startBlur,
              finalBlur: finalBlur,
              rectColor: widget.rectColor,
              smallSquareSide: widget.smallSquareSide,
              smallSquareScale: widget.smallSquareScale,
              rectBorderRadius: widget.rectBorderRadius,
            ),
          ],
        ),
      ),
    );
  }
}

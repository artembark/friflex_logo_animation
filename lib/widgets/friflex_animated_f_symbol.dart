import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'rectangle_glow.dart';
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
  }) : super(key: key);

  final AnimationController introController;
  final AnimationController transformController;

  final double bigSquareDiagonal;
  final double horizontalDiagonalOffset;
  final double halfBigSquareSide;
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
  static const smallSquareScale = 3.5;

  //для Flutter Web, т.к. в нем нельзя устанавливать значение 0
  //в blur sigmaX или sigmaY, открытая issue
  //https://github.com/flutter/flutter/issues/89433
  static const blurThreshold = 0.001;

  late Animation _introScaleAnimation;
  late Animation _introRotationAnimation;
  late Animation _introGlowSizeAnimation;
  late Animation _introGlowOpacityAnimation;
  late Animation _step1BlurAnimation;
  late Animation _step2ScaleAnimation;
  late Animation _step2BlurAnimation;
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

    _introGlowOpacityAnimation = Tween<double>(begin: 0.3, end: 0.0)
        .chain(CurveTween(curve: Curves.ease))
        .animate(
          CurvedAnimation(
            parent: widget.introController,
            curve: const Interval(
              0.5,
              1.0,
            ),
          ),
        );

    _introGlowSizeAnimation = Tween<double>(begin: 1.0, end: 1.8)
        .chain(CurveTween(curve: Curves.ease))
        .animate(
          CurvedAnimation(
            parent: widget.introController,
            curve: const Interval(
              0.5,
              1.0,
            ),
          ),
        );

    _step1BlurAnimation = TweenSequence([
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
          0.0,
          0.2,
        ),
      ),
    );
    _step2ScaleAnimation =
        Tween<double>(begin: smallSquareScale, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.transformController,
        curve: const Interval(
          0.2,
          0.4,
          curve: Curves.easeIn,
        ),
      ),
    );
    _step2BlurAnimation = TweenSequence([
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
          0.2,
          0.4,
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
            //верхний один
            if (_step5PositionAnimation.value > 0)
              Transform.translate(
                offset: Offset(
                    widget.horizontalDiagonalOffset *
                        (_step4PositionAnimation.value +
                            _step5PositionAnimation.value),
                    -widget.halfBigSquareSide * _step3PositionAnimation.value),
                child: RectanglePart(
                  color: widget.rectColor,
                  size: widget.smallSquareSide,
                  borderRadius: widget.rectBorderRadius,
                  blurValue: _step5BlurAnimation.value,
                ),
              ),
            //верхний из двух
            if (_step4PositionAnimation.value > 0)
              Transform.translate(
                offset: Offset(
                  widget.horizontalDiagonalOffset *
                      _step4PositionAnimation.value,
                  -widget.halfBigSquareSide * _step3PositionAnimation.value,
                ),
                child: RectanglePart(
                  color: widget.rectColor,
                  size: widget.smallSquareSide,
                  borderRadius: widget.rectBorderRadius,
                  blurValue: _step4BlurAnimation.value,
                ),
              ),
            //нижний из двух
            if (_step4PositionAnimation.value > 0)
              Transform.translate(
                offset: Offset(
                    widget.horizontalDiagonalOffset *
                        _step4PositionAnimation.value,
                    0),
                child: RectanglePart(
                  color: widget.rectColor,
                  size: widget.smallSquareSide,
                  borderRadius: widget.rectBorderRadius,
                  blurValue: _step4BlurAnimation.value,
                ),
              ),
            //верхний из трех
            if (_step3PositionAnimation.value > 0)
              Transform.translate(
                offset: Offset(
                  0,
                  -widget.halfBigSquareSide * _step3PositionAnimation.value,
                ),
                child: RectangleSmall(
                  color: widget.rectColor,
                  size: widget.smallSquareSide,
                  borderRadius: widget.rectBorderRadius,
                  blurValue: _step3BlurAnimation.value,
                ),
              ),
            //нижний из трех
            if (_step3PositionAnimation.value > 0)
              Transform.translate(
                offset: Offset(
                  0,
                  widget.halfBigSquareSide * _step3PositionAnimation.value,
                ),
                child: RectangleSmall(
                  color: widget.rectColor,
                  size: widget.smallSquareSide,
                  borderRadius: widget.rectBorderRadius,
                  blurValue: _step3BlurAnimation.value,
                ),
              ),
            //большой переходящий в маленький центральный
            Transform.scale(
              scale: _step2ScaleAnimation.value,
              child: Transform.rotate(
                angle: pi / 4 + _introRotationAnimation.value,
                child: SizedBox(
                  height: widget.smallSquareSide * blurOversize,
                  width: widget.smallSquareSide * blurOversize,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      RectangleGlow(
                        glowSize: _introGlowSizeAnimation,
                        glowOpacity: _introGlowOpacityAnimation,
                        color: widget.rectColor,
                        size: widget.smallSquareSide,
                        borderRadius: widget.rectBorderRadius,
                        child: Container(
                          height: widget.smallSquareSide,
                          width: widget.smallSquareSide,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              widget.rectBorderRadius,
                            ),
                            color: widget.rectColor,
                          ),
                        ),
                      ),
                      if (_step1BlurAnimation.value > blurThreshold)
                        ClipRect(
                          //try to use ImageFilter instead
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: _step1BlurAnimation.value,
                                sigmaY: _step1BlurAnimation.value),
                            child: Container(
                              height: widget.smallSquareSide * blurOversize,
                              width: widget.smallSquareSide * blurOversize,
                              color: Colors.black.withOpacity(0),
                            ),
                          ),
                        ),
                      if (_step2BlurAnimation.value > blurThreshold)
                        ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: _step2BlurAnimation.value,
                              sigmaY: _step2BlurAnimation.value,
                            ),
                            child: Container(
                              height: widget.smallSquareSide * blurOversize,
                              width: widget.smallSquareSide * blurOversize,
                              color: Colors.black.withOpacity(0),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

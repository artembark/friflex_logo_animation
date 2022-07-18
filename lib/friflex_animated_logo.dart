import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/rectangle_glow.dart';
import 'package:friflex_logo_animation/rectangle_small.dart';
import 'friflex_text_logo.dart';
import 'rectangle_part.dart';

class FriflexAnimatedLogo extends StatefulWidget {
  const FriflexAnimatedLogo({
    Key? key,
    required this.duration,
  }) : super(key: key);
  final Duration duration;

  @override
  State<FriflexAnimatedLogo> createState() => _FriflexAnimatedLogoState();
}

class _FriflexAnimatedLogoState extends State<FriflexAnimatedLogo>
    with TickerProviderStateMixin {
  static const startBlur = 0.0;
  static const finalBlur = 0.15;
  static const smallSquareScale = 3.5;
  static const blurOversize = 1.1;
  static const Color rectColor = Color(0xff685bc7);
  static const Color textColor = Colors.black;

  late AnimationController _transformController;
  late AnimationController _introController;
  late Animation _introScaleAnimation;
  late Animation _introRotationAnimation;
  late Animation _introGlowOpacityAnimation;
  late Animation _introGlowSizeAnimation;
  late Animation<double> _step1LogoPositionAnimation;
  late Animation _step1RectPositionAnimation;
  late Animation _step1BlurAnimation;
  late Animation _step2ScaleAnimation;
  late Animation _step2BlurAnimation;
  late Animation _step3PositionAnimation;
  late Animation _step3BlurAnimation;
  late Animation _step4PositionAnimation;
  late Animation _step4BlurAnimation;
  late Animation _step5PositionAnimation;
  late Animation _step5BlurAnimation;
  late Animation _iDotYPosition;
  late Animation _iDotRotation;
  late Animation _iDotOpacity;
  late Animation _iRectHeight;

  @override
  void initState() {
    super.initState();
    _transformController =
        AnimationController(vsync: this, duration: widget.duration);
    _introController =
        AnimationController(vsync: this, duration: widget.duration * 2);

    _introScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _introController,
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
            parent: _introController,
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
            parent: _introController,
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
            parent: _introController,
            curve: const Interval(
              0.5,
              1.0,
            ),
          ),
        );

    _step1LogoPositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformController,
        curve: const Interval(
          0.0,
          0.18,
          curve: Curves.easeIn,
        ),
      ),
    );
    _step1RectPositionAnimation =
        Tween<double>(begin: 1.0, end: 62 / 862).animate(
      CurvedAnimation(
        parent: _transformController,
        curve: const Interval(
          0.0,
          0.2,
          curve: Curves.easeIn,
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
        parent: _transformController,
        curve: const Interval(
          0.0,
          0.2,
        ),
      ),
    );
    _step2ScaleAnimation =
        Tween<double>(begin: smallSquareScale, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformController,
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
        parent: _transformController,
        curve: const Interval(
          0.2,
          0.4,
        ),
      ),
    );
    _step3PositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformController,
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
        parent: _transformController,
        curve: const Interval(
          0.4,
          0.6,
        ),
      ),
    );
    _step4PositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformController,
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
        parent: _transformController,
        curve: const Interval(
          0.6,
          0.8,
        ),
      ),
    );
    _step5PositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformController,
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
        parent: _transformController,
        curve: const Interval(
          0.8,
          1.0,
        ),
      ),
    );

    _iDotOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformController,
        curve: const Interval(
          0.6,
          0.68,
          curve: Curves.linear,
        ),
      ),
    );

    _iDotYPosition = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: -0.5, end: 0.96)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 0.15),
      TweenSequenceItem(
          tween: Tween(begin: 0.96, end: 1.00)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 0.05),
      TweenSequenceItem(
          tween: Tween(begin: 1.00, end: 0.3)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 0.10),
      TweenSequenceItem(
          tween: Tween(begin: 0.3, end: 0.6)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 0.15),
    ]).animate(
      CurvedAnimation(
        parent: _transformController,
        curve: const Interval(
          0.6,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );

    _iDotRotation = TweenSequence([
      TweenSequenceItem<double>(tween: ConstantTween<double>(1.0), weight: 0.2),
      TweenSequenceItem(
          tween: Tween(begin: 1.00, end: 3.0)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 0.25),
    ]).animate(
      CurvedAnimation(
        parent: _transformController,
        curve: const Interval(
          0.6,
          1.0,
        ),
      ),
    );

    _iRectHeight = TweenSequence([
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(1.0), weight: 0.15),
      TweenSequenceItem(
          tween: Tween(begin: 1.00, end: 1.1)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 0.05),
      TweenSequenceItem(
          tween:
              Tween(begin: 1.1, end: 1.4).chain(CurveTween(curve: Curves.ease)),
          weight: 0.05),
      TweenSequenceItem(
          tween: Tween(begin: 1.4, end: 1.0)
              .chain(CurveTween(curve: Curves.easeInOutBack)),
          weight: 0.10),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(1.0), weight: 0.10),
    ]).animate(
      CurvedAnimation(
        parent: _transformController,
        curve: const Interval(
          0.6,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );

    _introController.forward();
    _introController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _transformController.forward();
      }
    });
  }

  @override
  void dispose() {
    _transformController.dispose();
    _introController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //для Flutter Web, т.к. в нем нельзя устанавливать значение 0
    //в blur sigmaX или sigmaY, открытая issue
    //https://github.com/flutter/flutter/issues/89433
    final step1Moving = _step2BlurAnimation.value > 0.001;
    final step0Moving = _step1BlurAnimation.value > 0.001;
//replace setState with animatedBuilder
    return LayoutBuilder(builder: (context, constraints) {
      //расчеты для адаптивности
      final logoWidth = constraints.maxWidth;
      final logoHeight = logoWidth * 200 / 862;
      final bigSquareDiagonal = logoHeight;
      final bigSquareSide = bigSquareDiagonal / sqrt(2.0);
      final bigSquareDiagonalDiff = bigSquareSide / 2 * (sqrt(2.0) - 1);
      final smallSquareSide = bigSquareSide / smallSquareScale;
      final halfBigSquareSide = bigSquareSide / 2.0;
      final borderRadius = smallSquareSide / 6.0;
      final horizontalDiagonalOffset =
          smallSquareSide * (1 + (sqrt(2) - 1)) * 0.9;

      return AnimatedBuilder(
          animation: Listenable.merge(
            [
              _introController,
              _transformController,
            ],
          ),
          builder: (context, _) {
            return SizedBox(
              width: logoWidth,
              height: logoHeight,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0.0,
                    right: bigSquareSide / 2.0 + bigSquareDiagonalDiff,
                    child: SizeTransition(
                      sizeFactor: _step1LogoPositionAnimation,
                      axis: Axis.horizontal,
                      axisAlignment: 1,
                      child: FriflexTextLogo(
                        logoWidth: logoWidth,
                        iDotYPosition: _iDotYPosition,
                        iRectHeight: _iRectHeight,
                        iDotRotation: _iDotRotation,
                        iDotOpacity: _iDotOpacity,
                        textColor: textColor,
                        rectColor: rectColor,
                      ),
                    ),
                  ),
                  Positioned(
                    left: _step1RectPositionAnimation.value *
                        (logoWidth / 2 - bigSquareDiagonal / 2),
                    bottom: 0,
                    child: Transform.scale(
                      scale: _introScaleAnimation.value,
                      child: SizedBox(
                        height: bigSquareDiagonal,
                        width: bigSquareDiagonal,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            //верхний один
                            if (_step5PositionAnimation.value > 0)
                              Transform.translate(
                                offset: Offset(
                                    horizontalDiagonalOffset *
                                        (_step4PositionAnimation.value +
                                            _step5PositionAnimation.value),
                                    -halfBigSquareSide *
                                        _step3PositionAnimation.value),
                                child: RectanglePart(
                                  color: rectColor,
                                  size: smallSquareSide,
                                  borderRadius: borderRadius,
                                  blurValue: _step5BlurAnimation.value,
                                ),
                              ),
                            //верхний из двух
                            if (_step4PositionAnimation.value > 0)
                              Transform.translate(
                                offset: Offset(
                                  horizontalDiagonalOffset *
                                      _step4PositionAnimation.value,
                                  -halfBigSquareSide *
                                      _step3PositionAnimation.value,
                                ),
                                child: RectanglePart(
                                  color: rectColor,
                                  size: smallSquareSide,
                                  borderRadius: borderRadius,
                                  blurValue: _step4BlurAnimation.value,
                                ),
                              ),
                            //нижний из двух
                            if (_step4PositionAnimation.value > 0)
                              Transform.translate(
                                offset: Offset(
                                    horizontalDiagonalOffset *
                                        _step4PositionAnimation.value,
                                    0),
                                child: RectanglePart(
                                  color: rectColor,
                                  size: smallSquareSide,
                                  borderRadius: borderRadius,
                                  blurValue: _step4BlurAnimation.value,
                                ),
                              ),
                            //верхний из трех
                            if (_step3PositionAnimation.value > 0)
                              Transform.translate(
                                offset: Offset(
                                  0,
                                  -halfBigSquareSide *
                                      _step3PositionAnimation.value,
                                ),
                                child: RectangleSmall(
                                  color: rectColor,
                                  size: smallSquareSide,
                                  borderRadius: borderRadius,
                                  blurValue: _step3BlurAnimation.value,
                                ),
                              ),
                            //нижний из трех
                            if (_step3PositionAnimation.value > 0)
                              Transform.translate(
                                offset: Offset(
                                  0,
                                  halfBigSquareSide *
                                      _step3PositionAnimation.value,
                                ),
                                child: RectangleSmall(
                                  color: rectColor,
                                  size: smallSquareSide,
                                  borderRadius: borderRadius,
                                  blurValue: _step3BlurAnimation.value,
                                ),
                              ),
                            //большой переходящий в маленький центральный
                            Transform.scale(
                              scale: _step2ScaleAnimation.value,
                              child: Transform.rotate(
                                angle: pi / 4 + _introRotationAnimation.value,
                                child: SizedBox(
                                  height: smallSquareSide * blurOversize,
                                  width: smallSquareSide * blurOversize,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      RectangleGlow(
                                        glowSize: _introGlowSizeAnimation,
                                        glowOpacity: _introGlowOpacityAnimation,
                                        color: rectColor,
                                        size: smallSquareSide,
                                        borderRadius: borderRadius,
                                        child: Container(
                                          height: smallSquareSide,
                                          width: smallSquareSide,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              borderRadius,
                                            ),
                                            color: rectColor,
                                          ),
                                        ),
                                      ),
                                      if (step0Moving)
                                        ClipRect(
                                          //try to use ImageFilter instead
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX:
                                                    _step1BlurAnimation.value,
                                                sigmaY:
                                                    _step1BlurAnimation.value),
                                            child: Container(
                                              height: smallSquareSide *
                                                  blurOversize,
                                              width: smallSquareSide *
                                                  blurOversize,
                                              color:
                                                  Colors.black.withOpacity(0),
                                            ),
                                          ),
                                        ),
                                      if (step1Moving)
                                        ClipRect(
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: _step2BlurAnimation.value,
                                              sigmaY: _step2BlurAnimation.value,
                                            ),
                                            child: Container(
                                              height: smallSquareSide * 1.1,
                                              width: smallSquareSide * 1.1,
                                              color:
                                                  Colors.black.withOpacity(0),
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
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }
}

import 'package:flutter/material.dart';

class LogoAnimation {
  static const startBlur = 0.0;
  static const finalBlur = 0.45;

  Animation squareBlurAnimation({
    required AnimationController controller,
    required double begin,
    required double end,
  }) {
    return TweenSequence([
      // TweenSequenceItem(
      //     tween: Tween(begin: startBlur, end: finalBlur)
      //         .chain(CurveTween(curve: Curves.ease)),
      //     weight: 0.2),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(startBlur), weight: 0.2),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(finalBlur), weight: 0.6),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(startBlur), weight: 0.2),
      // TweenSequenceItem(
      //     tween: Tween(begin: finalBlur, end: startBlur)
      //         .chain(CurveTween(curve: Curves.ease)),
      //     weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          begin,
          end,
        ),
      ),
    );
  }

  Animation smallSquarePositionAnimation(
      {required AnimationController controller,
      required double begin,
      required double end}) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          begin,
          end,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  Animation<double> intervalTween({
    required AnimationController controller,
    required Curve curve,
    required double tweenBegin,
    required double tweenEnd,
    required double intervalBegin,
    required double intervalEnd,
  }) {
    return Tween<double>(begin: tweenBegin, end: tweenEnd).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          intervalBegin,
          intervalEnd,
          curve: curve,
        ),
      ),
    );
  }
}

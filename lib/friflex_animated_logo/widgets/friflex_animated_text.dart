import 'package:flutter/material.dart';

import 'friflex_text_logo.dart';

class FriflexAnimatedText extends StatefulWidget {
  const FriflexAnimatedText({
    Key? key,
    required this.controller,
    required this.logoWidth,
  }) : super(key: key);

  final AnimationController controller;
  final double logoWidth;

  @override
  State<FriflexAnimatedText> createState() => _FriflexAnimatedTextState();
}

class _FriflexAnimatedTextState extends State<FriflexAnimatedText> {
  late Animation<double> _step1LogoPositionAnimation;
  late Animation _iDotYPosition;
  late Animation _iRectHeight;
  late Animation _iDotRotation;
  late Animation _iDotOpacity;

  @override
  void initState() {
    super.initState();

    _step1LogoPositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: const Interval(
          0.0,
          0.18,
          curve: Curves.easeIn,
        ),
      ),
    );

    _iDotOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: const Interval(
          0.6,
          0.68,
          curve: Curves.linear,
        ),
      ),
    );

    _iDotYPosition = TweenSequence<double>([
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
        parent: widget.controller,
        curve: const Interval(
          0.6,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );

    _iDotRotation = TweenSequence<double>([
      TweenSequenceItem<double>(tween: ConstantTween<double>(1.0), weight: 0.2),
      TweenSequenceItem(
          tween: Tween(begin: 1.00, end: 3.0)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 0.25),
    ]).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: const Interval(
          0.6,
          1.0,
        ),
      ),
    );

    _iRectHeight = TweenSequence<double>([
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
        parent: widget.controller,
        curve: const Interval(
          0.6,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _step1LogoPositionAnimation,
      axis: Axis.horizontal,
      axisAlignment: 1,
      child: FriflexTextLogo(
        logoWidth: widget.logoWidth,
        iDotYPosition: _iDotYPosition,
        iRectHeight: _iRectHeight,
        iDotRotation: _iDotRotation,
        iDotOpacity: _iDotOpacity,
      ),
    );
  }
}

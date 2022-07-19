import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/animations/logo_animation.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/utils/logo_const.dart';

import 'friflex_i_painter.dart';

class FriflexTextLogo extends StatefulWidget {
  ///Виджет композиции svg логотипа Friflex без символа i
  ///и CustomPainter анимированного символа  i
  const FriflexTextLogo({
    Key? key,
    required this.controller,
    required this.logoWidth,
  }) : super(key: key);

  final double logoWidth;
  final AnimationController controller;

  @override
  State<FriflexTextLogo> createState() => _FriflexTextLogoState();
}

class _FriflexTextLogoState extends State<FriflexTextLogo> {
  late Animation _iDotYPosition;
  late Animation _iRectHeight;
  late Animation _iDotRotation;
  late Animation _iDotOpacity;

  @override
  void initState() {
    super.initState();

    _iDotOpacity = LogoAnimation().intervalTween(
      controller: widget.controller,
      curve: Curves.linear,
      tweenBegin: 0.0,
      tweenEnd: 1.0,
      intervalBegin: 0.6,
      intervalEnd: 0.68,
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
    return SizedBox(
      width: widget.logoWidth * 490 / 862,
      height: widget.logoWidth * 200 / 862,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: widget.logoWidth * 490 / 862,
            height: widget.logoWidth * 132 / 862,
            child: CustomPaint(
              painter: FriflexIPainter(
                iDotYPosition: _iDotYPosition.value,
                iRectHeight: _iRectHeight.value,
                iDotRotation: _iDotRotation.value,
                iDotOpacity: _iDotOpacity.value,
              ),
            ),
          ),
          SizedBox(
            width: widget.logoWidth * 490 / 862,
            height: widget.logoWidth * 132 / 862,
            child: SvgPicture.asset(
              LogoConst.svgLogoPath,
              fit: BoxFit.fill,
              color: LogoConst.textColor,
            ),
          ),
        ],
      ),
    );
  }
}

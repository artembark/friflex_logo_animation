import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/animations/logo_animation.dart';

import 'friflex_text_logo.dart';

class FriflexAnimatedText extends StatefulWidget {
  ///Виджет анимации появления текста Friflex с анимированным символом i
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

  @override
  void initState() {
    super.initState();

    _step1LogoPositionAnimation = LogoAnimation().intervalTween(
      controller: widget.controller,
      curve: Curves.easeIn,
      tweenBegin: 0.0,
      tweenEnd: 1.0,
      intervalBegin: 0.0,
      intervalEnd: 0.18,
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
        controller: widget.controller,
      ),
    );
  }
}

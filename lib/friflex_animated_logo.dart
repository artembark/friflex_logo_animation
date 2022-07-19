import 'dart:math';

import 'package:flutter/material.dart';
import 'widgets/friflex_animated_f_symbol.dart';
import 'widgets/friflex_animated_text.dart';

class FriflexAnimatedLogo extends StatefulWidget {
  const FriflexAnimatedLogo({
    Key? key,
    required this.duration,
  }) : super(key: key);
  final Duration duration;
  @override
  State<FriflexAnimatedLogo> createState() => FriflexAnimatedLogoState();
}

class FriflexAnimatedLogoState extends State<FriflexAnimatedLogo>
    with TickerProviderStateMixin {
  static const smallSquareScale = 3.5;
  static const Color rectColor = Color(0xff685bc7);
  static const Color textColor = Colors.black;

  late AnimationController transformController;
  late AnimationController introController;
  late Animation _step1RectPositionAnimation;

  @override
  void initState() {
    super.initState();
    transformController =
        AnimationController(vsync: this, duration: widget.duration);
    introController =
        AnimationController(vsync: this, duration: widget.duration * 2);

    _step1RectPositionAnimation =
        Tween<double>(begin: 1.0, end: 62 / 862).animate(
      CurvedAnimation(
        parent: transformController,
        curve: const Interval(
          0.0,
          0.2,
          curve: Curves.easeIn,
        ),
      ),
    );

    introController.forward();
    introController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        transformController.forward();
      }
    });
  }

  @override
  void dispose() {
    transformController.dispose();
    introController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              introController,
              transformController,
            ],
          ),
          builder: (context, _) {
            return SizedBox(
              width: logoWidth,
              height: logoHeight,
              child: Stack(
                children: [
                  //текст Friflex с нарисованной i
                  Positioned(
                    bottom: 0.0,
                    right: bigSquareSide / 2.0 + bigSquareDiagonalDiff,
                    child: FriflexAnimatedText(
                        controller: transformController,
                        logoWidth: logoWidth,
                        textColor: textColor,
                        rectColor: rectColor),
                  ),
                  //появление и трансформация ромба
                  Positioned(
                    left: _step1RectPositionAnimation.value *
                        (logoWidth / 2 - logoHeight / 2),
                    bottom: 0,
                    child: FriflexAnimatedFSymbol(
                      introController: introController,
                      transformController: transformController,
                      rectColor: rectColor,
                      rectBorderRadius: borderRadius,
                      bigSquareDiagonal: bigSquareDiagonal,
                      horizontalDiagonalOffset: horizontalDiagonalOffset,
                      halfBigSquareSide: halfBigSquareSide,
                      smallSquareSide: smallSquareSide,
                      smallSquareScale: smallSquareScale,
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }
}

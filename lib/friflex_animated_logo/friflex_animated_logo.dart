import 'dart:math';

import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/animations/logo_animation.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/utils/logo_const.dart';
import 'widgets/friflex_animated_f_symbol.dart';
import 'widgets/friflex_animated_text.dart';

class FriflexAnimatedLogo extends StatefulWidget {
  ///Анимированный логотип Friflex, размер подстраивается под заданный родителем,
  ///длительность анимации задается параметром [duration],
  ///управлять контроллерами с родительского виджета можно передав ключ [key]
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
  late AnimationController transformController;
  late AnimationController introController;
  late Animation _step1SquarePositionAnimation;

  @override
  void initState() {
    super.initState();
    transformController =
        AnimationController(vsync: this, duration: widget.duration);
    introController =
        AnimationController(vsync: this, duration: widget.duration);

    _step1SquarePositionAnimation = LogoAnimation().intervalTween(
      controller: transformController,
      curve: Curves.easeIn,
      tweenBegin: 1.0,
      tweenEnd: 62 / 862,
      intervalBegin: 0.0,
      intervalEnd: 0.2,
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
      final smallSquareSide = bigSquareSide / LogoConst.smallSquareScale;
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
            return RepaintBoundary(
              child: SizedBox(
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
                      ),
                    ),
                    //появление, смещение и трансформация ромба в F
                    Positioned(
                      left: _step1SquarePositionAnimation.value *
                          (logoWidth / 2.0 - logoHeight / 2.0),
                      bottom: 0,
                      child: FriflexAnimatedFSymbol(
                        introController: introController,
                        transformController: transformController,
                        squareBorderRadius: borderRadius,
                        bigSquareDiagonal: bigSquareDiagonal,
                        horizontalDiagonalOffset: horizontalDiagonalOffset,
                        halfBigSquareSide: halfBigSquareSide,
                        smallSquareSide: smallSquareSide,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }
}

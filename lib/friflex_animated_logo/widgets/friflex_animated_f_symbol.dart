import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/animations/logo_animation.dart';

import 'square_big_to_small.dart';
import 'square_part_translated.dart';
import 'square_translated.dart';

class FriflexAnimatedFSymbol extends StatefulWidget {
  ///Виджет анимации появления большого ромба и трансформации
  ///его в букву F из 5 маленьких ромбов
  const FriflexAnimatedFSymbol({
    Key? key,
    required this.introController,
    required this.transformController,
    required this.bigSquareDiagonal,
    required this.horizontalDiagonalOffset,
    required this.halfBigSquareSide,
    required this.smallSquareSide,
    required this.squareBorderRadius,
  }) : super(key: key);

  final AnimationController introController;
  final AnimationController transformController;

  final double bigSquareDiagonal;
  final double horizontalDiagonalOffset;
  final double halfBigSquareSide;
  final double smallSquareSide;
  final double squareBorderRadius;

  @override
  State<FriflexAnimatedFSymbol> createState() => _FriflexAnimatedFSymbolState();
}

class _FriflexAnimatedFSymbolState extends State<FriflexAnimatedFSymbol> {
  late Animation _step3PositionAnimation;
  late Animation _step3BlurAnimation;
  late Animation _step4PositionAnimation;
  late Animation _step4BlurAnimation;
  late Animation _step5PositionAnimation;
  late Animation _step5BlurAnimation;

  @override
  void initState() {
    super.initState();
    _step3PositionAnimation = LogoAnimation().smallSquarePositionAnimation(
      controller: widget.transformController,
      begin: 0.4,
      end: 0.6,
    );
    _step3BlurAnimation = LogoAnimation().squareBlurAnimation(
      controller: widget.transformController,
      begin: 0.4,
      end: 0.6,
    );
    _step4PositionAnimation = LogoAnimation().smallSquarePositionAnimation(
      controller: widget.transformController,
      begin: 0.6,
      end: 0.8,
    );
    _step4BlurAnimation = LogoAnimation().squareBlurAnimation(
      controller: widget.transformController,
      begin: 0.6,
      end: 0.8,
    );
    _step5PositionAnimation = LogoAnimation().smallSquarePositionAnimation(
      controller: widget.transformController,
      begin: 0.8,
      end: 1.0,
    );
    _step5BlurAnimation = LogoAnimation().squareBlurAnimation(
      controller: widget.transformController,
      begin: 0.8,
      end: 1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge(
            [widget.introController, widget.transformController]),
        builder: (context, _) {
          return SizedBox(
            height: widget.bigSquareDiagonal,
            width: widget.bigSquareDiagonal,
            child: Stack(
              alignment: Alignment.center,
              children: [
                //правый верхний
                if (_step5PositionAnimation.value > 0)
                  SquarePartTranslated(
                    size: widget.smallSquareSide,
                    offset: Offset(
                      widget.horizontalDiagonalOffset *
                          (_step4PositionAnimation.value +
                              _step5PositionAnimation.value),
                      -widget.halfBigSquareSide * _step3PositionAnimation.value,
                    ),
                    borderRadius: widget.squareBorderRadius,
                    blurValue: _step5BlurAnimation.value,
                  ),
                //центральный верхний
                if (_step4PositionAnimation.value > 0)
                  SquarePartTranslated(
                    size: widget.smallSquareSide,
                    offset: Offset(
                      widget.horizontalDiagonalOffset *
                          _step4PositionAnimation.value,
                      -widget.halfBigSquareSide * _step3PositionAnimation.value,
                    ),
                    borderRadius: widget.squareBorderRadius,
                    blurValue: _step4BlurAnimation.value,
                  ),
                //центральный
                if (_step4PositionAnimation.value > 0)
                  SquarePartTranslated(
                    size: widget.smallSquareSide,
                    offset: Offset(
                        widget.horizontalDiagonalOffset *
                            _step4PositionAnimation.value,
                        0),
                    borderRadius: widget.squareBorderRadius,
                    blurValue: _step4BlurAnimation.value,
                  ),
                //левый верхний
                if (_step3PositionAnimation.value > 0)
                  SquareTranslated(
                    size: widget.smallSquareSide,
                    offset: Offset(
                      0,
                      -widget.halfBigSquareSide * _step3PositionAnimation.value,
                    ),
                    borderRadius: widget.squareBorderRadius,
                    blurValue: _step3BlurAnimation.value,
                  ),
                //левый нижний
                if (_step3PositionAnimation.value > 0)
                  SquareTranslated(
                    size: widget.smallSquareSide,
                    offset: Offset(
                      0,
                      widget.halfBigSquareSide * _step3PositionAnimation.value,
                    ),
                    borderRadius: widget.squareBorderRadius,
                    blurValue: _step3BlurAnimation.value,
                  ),
                //большой, переходящий в левый центральный
                SquareBigToSmall(
                  introController: widget.introController,
                  transformController: widget.transformController,
                  smallSquareSide: widget.smallSquareSide,
                  squareBorderRadius: widget.squareBorderRadius,
                ),
              ],
            ),
          );
        });
  }
}

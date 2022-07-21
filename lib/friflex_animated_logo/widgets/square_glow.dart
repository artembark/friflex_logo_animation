import 'dart:math';

import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/animations/logo_animation.dart';

class SquareGlow extends StatefulWidget {
  ///Виджет, создающий затухающую цветную волну от квадратного контейнера.
  ///Для использования необходим управляющий контроллер [controller],
  ///контейнер вокгруг которого будет анимироваться волна [child],
  ///цвет волны [color], начальный размер [size],
  ///степень увеличения [scaleFactor], радиус углов [borderRadius]
  const SquareGlow({
    Key? key,
    required this.controller,
    required this.child,
    required this.color,
    required this.size,
    required this.borderRadius,
    required this.scaleFactor,
  }) : super(key: key);
  final AnimationController controller;
  final Widget child;
  final Color color;
  final double size;
  final double borderRadius;
  final double scaleFactor;

  @override
  State<SquareGlow> createState() => _SquareGlowState();
}

class _SquareGlowState extends State<SquareGlow> {
  late Animation _introGlowSizeAnimation;
  late Animation _introGlowOpacityAnimation;

  @override
  void initState() {
    super.initState();

    _introGlowOpacityAnimation = LogoAnimation().intervalTween(
      controller: widget.controller,
      curve: Curves.ease,
      tweenBegin: 0.3,
      tweenEnd: 0.0,
      intervalBegin: 0.5,
      intervalEnd: 1.0,
    );
    _introGlowSizeAnimation = LogoAnimation().intervalTween(
      controller: widget.controller,
      curve: Curves.ease,
      tweenBegin: 1.0,
      tweenEnd: widget.scaleFactor,
      intervalBegin: 0.5,
      intervalEnd: 1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      child: widget.child,
      builder: (context, child) {
        return Stack(
          children: [
            Transform.rotate(
              angle: pi / 4,
              child: Transform.scale(
                scale: _introGlowSizeAnimation.value,
                child: Container(
                  height: widget.size,
                  width: widget.size,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      widget.borderRadius,
                    ),
                    color: widget.color.withOpacity(
                      _introGlowOpacityAnimation.value,
                    ),
                  ),
                ),
              ),
            ),
            child ?? const SizedBox.shrink()
          ],
        );
      },
    );
  }
}

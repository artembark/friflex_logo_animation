import 'package:flutter/material.dart';

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

    _introGlowOpacityAnimation = Tween<double>(begin: 0.3, end: 0.0)
        .chain(CurveTween(curve: Curves.ease))
        .animate(
          CurvedAnimation(
            parent: widget.controller,
            curve: const Interval(
              0.5,
              1.0,
            ),
          ),
        );

    _introGlowSizeAnimation = Tween<double>(begin: 1.0, end: widget.scaleFactor)
        .chain(CurveTween(curve: Curves.ease))
        .animate(
          CurvedAnimation(
            parent: widget.controller,
            curve: const Interval(
              0.5,
              1.0,
            ),
          ),
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
            Transform.scale(
              scale: _introGlowSizeAnimation.value,
              child: Container(
                height: widget.size,
                width: widget.size,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius,
                  ),
                  color: widget.color
                      .withOpacity(_introGlowOpacityAnimation.value),
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

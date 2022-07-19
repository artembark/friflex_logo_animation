import 'package:flutter/material.dart';

class RectangleGlow extends StatefulWidget {
  const RectangleGlow({
    Key? key,
    required this.introController,
    required this.child,
    required this.color,
    required this.size,
    required this.borderRadius,
  }) : super(key: key);
  final AnimationController introController;
  final Widget child;
  final Color color;
  final double size;
  final double borderRadius;

  @override
  State<RectangleGlow> createState() => _RectangleGlowState();
}

class _RectangleGlowState extends State<RectangleGlow> {
  late Animation _introGlowSizeAnimation;
  late Animation _introGlowOpacityAnimation;

  @override
  void initState() {
    super.initState();

    _introGlowOpacityAnimation = Tween<double>(begin: 0.3, end: 0.0)
        .chain(CurveTween(curve: Curves.ease))
        .animate(
          CurvedAnimation(
            parent: widget.introController,
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
            parent: widget.introController,
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
      animation: widget.introController,
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

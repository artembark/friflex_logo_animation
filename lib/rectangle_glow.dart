import 'package:flutter/material.dart';

class RectangleGlow extends StatelessWidget {
  const RectangleGlow(
      {Key? key,
      required this.glowSize,
      required this.glowOpacity,
      required this.child,
      required this.color,
      required this.size,
      required this.borderRadius})
      : super(key: key);
  final Animation glowSize;
  final Animation glowOpacity;
  final Widget child;
  final Color color;
  final double size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([glowSize, glowOpacity]),
      child: child,
      builder: (context, child) {
        return Stack(
          children: [
            Transform.scale(
              scale: glowSize.value,
              child: Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    borderRadius,
                  ),
                  color: color.withOpacity(glowOpacity.value),
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

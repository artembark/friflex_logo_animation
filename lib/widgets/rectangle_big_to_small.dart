import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'rectangle_glow.dart';

class BigToSmallRectangle extends StatefulWidget {
  const BigToSmallRectangle({
    Key? key,
    required this.introController,
    required this.transformController,
    required this.blurOversize,
    required this.blurThreshold,
    required this.startBlur,
    required this.finalBlur,
    required this.rectColor,
    required this.smallSquareSide,
    required this.smallSquareScale,
    required this.rectBorderRadius,
  }) : super(key: key);

  final AnimationController introController;
  final AnimationController transformController;
  final Color rectColor;
  final double smallSquareSide;
  final double smallSquareScale;
  final double rectBorderRadius;
  final double startBlur;
  final double finalBlur;
  final double blurOversize;
  final double blurThreshold;

  @override
  State<BigToSmallRectangle> createState() => _BigToSmallRectangleState();
}

class _BigToSmallRectangleState extends State<BigToSmallRectangle> {
  late Animation _introRotationAnimation;
  late Animation _step1BlurAnimation;
  late Animation _step2BlurAnimation;
  late Animation _step2ScaleAnimation;

  @override
  void initState() {
    super.initState();
    _introRotationAnimation = Tween<double>(begin: -2 * pi, end: 0.0)
        .chain(CurveTween(curve: Curves.easeOutBack))
        .animate(
          CurvedAnimation(
            parent: widget.introController,
            curve: const Interval(
              0.0,
              0.5,
            ),
          ),
        );
    _step1BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: widget.startBlur, end: widget.finalBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(widget.finalBlur), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: widget.finalBlur, end: widget.startBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: widget.transformController,
        curve: const Interval(
          0.0,
          0.2,
        ),
      ),
    );
    _step2ScaleAnimation =
        Tween<double>(begin: widget.smallSquareScale, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.transformController,
        curve: const Interval(
          0.2,
          0.4,
          curve: Curves.easeIn,
        ),
      ),
    );
    _step2BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: widget.startBlur, end: widget.finalBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(widget.finalBlur), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: widget.finalBlur, end: widget.startBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: widget.transformController,
        curve: const Interval(
          0.2,
          0.4,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _step2ScaleAnimation.value,
      child: Transform.rotate(
        angle: pi / 4 + _introRotationAnimation.value,
        child: SizedBox(
          height: widget.smallSquareSide * widget.blurOversize,
          width: widget.smallSquareSide * widget.blurOversize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              RectangleGlow(
                introController: widget.introController,
                color: widget.rectColor,
                size: widget.smallSquareSide,
                borderRadius: widget.rectBorderRadius,
                child: Container(
                  height: widget.smallSquareSide,
                  width: widget.smallSquareSide,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      widget.rectBorderRadius,
                    ),
                    color: widget.rectColor,
                  ),
                ),
              ),
              if (_step1BlurAnimation.value > widget.blurThreshold)
                ClipRect(
                  //try to use ImageFilter instead
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: _step1BlurAnimation.value,
                        sigmaY: _step1BlurAnimation.value),
                    child: Container(
                      height: widget.smallSquareSide * widget.blurOversize,
                      width: widget.smallSquareSide * widget.blurOversize,
                      color: Colors.black.withOpacity(0),
                    ),
                  ),
                ),
              if (_step2BlurAnimation.value > widget.blurThreshold)
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: _step2BlurAnimation.value,
                      sigmaY: _step2BlurAnimation.value,
                    ),
                    child: Container(
                      height: widget.smallSquareSide * widget.blurOversize,
                      width: widget.smallSquareSide * widget.blurOversize,
                      color: Colors.black.withOpacity(0),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

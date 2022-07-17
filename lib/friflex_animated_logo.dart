import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FriflexAnimatedLogo extends StatefulWidget {
  const FriflexAnimatedLogo({
    Key? key,
    required this.duration,
  }) : super(key: key);
  final Duration duration;

  @override
  State<FriflexAnimatedLogo> createState() => _FriflexAnimatedLogoState();
}

class _FriflexAnimatedLogoState extends State<FriflexAnimatedLogo>
    with TickerProviderStateMixin {
  static const Color rectColor = Color(0xff685bc7);
  late AnimationController _transformFController;
  late AnimationController _startingController;
  late Animation _startScaleAnimation;
  late Animation _startRotationAnimation;
  late Animation _glowOpacityAnimation;
  late Animation _glowSizeAnimation;
  late Animation<double> _step1LogoPositionAnimation;
  late Animation _step1RectPositionAnimation;
  late Animation _step1BlurAnimation;
  late Animation _step2ScaleAnimation;
  late Animation _step2BlurAnimation;
  late Animation _step3PositionAnimation;
  late Animation _step3BlurAnimation;
  late Animation _step4PositionAnimation;
  late Animation _step4BlurAnimation;
  late Animation _step5PositionAnimation;
  late Animation _step5BlurAnimation;
  late Animation _fallingIPosition;
  late Animation _fallingIRotation;
  late Animation _fallingIOpacity;
  late Animation _iRectHeight;
  final startBlur = 0.0;
  final finalBlur = 0.15;
  final squareScale = 3.5;
  final sliderValue = 0;
  final rotationAngle = pi / 8;
  bool _canTransform = false;

  @override
  void initState() {
    super.initState();
    _transformFController =
        AnimationController(vsync: this, duration: widget.duration);
    _startingController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 10000));
    _startScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _startingController,
        curve: const Interval(
          0.0,
          0.2,
          curve: Curves.elasticOut,
        ),
      ),
    );
    _startRotationAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: -3 * pi, end: 0.0)
              .chain(CurveTween(curve: Curves.elasticOut)),
          weight: 0.3),
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: rotationAngle)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 0.1),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(rotationAngle), weight: 0.1),
      TweenSequenceItem(
          tween: Tween(begin: rotationAngle, end: 0)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 0.1),
      // TweenSequenceItem<double>(tween: ConstantTween<double>(0), weight: 0.1),
      TweenSequenceItem(
          tween: Tween(begin: 0, end: -rotationAngle)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 0.1),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(-rotationAngle), weight: 0.1),
      TweenSequenceItem(
          tween: Tween(begin: -rotationAngle, end: 0)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 0.1),
    ]).animate(
      CurvedAnimation(
        parent: _startingController,
        curve: const Interval(
          0.0,
          1.0,
        ),
      ),
    );

    _glowOpacityAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: ConstantTween<double>(0.0), weight: 0.4),
      TweenSequenceItem(
          tween:
              Tween(begin: 0.3, end: 0.0).chain(CurveTween(curve: Curves.ease)),
          weight: 0.1),
      TweenSequenceItem<double>(tween: ConstantTween<double>(0.0), weight: 0.2),
      TweenSequenceItem(
          tween:
              Tween(begin: 0.3, end: 0.0).chain(CurveTween(curve: Curves.ease)),
          weight: 0.1),
      TweenSequenceItem<double>(tween: ConstantTween<double>(0.0), weight: 0.1),
    ]).animate(
      CurvedAnimation(
        parent: _startingController,
        curve: const Interval(
          0.0,
          1.0,
        ),
      ),
    );

    _glowSizeAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: ConstantTween<double>(0.0), weight: 0.4),
      TweenSequenceItem(
          tween:
              Tween(begin: 1.0, end: 1.8).chain(CurveTween(curve: Curves.ease)),
          weight: 0.1),
      TweenSequenceItem<double>(tween: ConstantTween<double>(0.0), weight: 0.2),
      TweenSequenceItem(
          tween:
              Tween(begin: 1.0, end: 1.8).chain(CurveTween(curve: Curves.ease)),
          weight: 0.1),
      TweenSequenceItem<double>(tween: ConstantTween<double>(0.0), weight: 0.1),
    ]).animate(
      CurvedAnimation(
        parent: _startingController,
        curve: const Interval(
          0.0,
          1.0,
        ),
      ),
    );

    _step1LogoPositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.0,
          0.18,
          curve: Curves.easeIn,
        ),
      ),
    );
    _step1RectPositionAnimation =
        Tween<double>(begin: 1.0, end: 62 / 862).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.0,
          0.2,
          curve: Curves.easeIn,
        ),
      ),
    );
    _step1BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: startBlur, end: finalBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(finalBlur), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: finalBlur, end: startBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.0,
          0.2,
        ),
      ),
    );
    _step2ScaleAnimation = Tween<double>(begin: squareScale, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.2,
          0.4,
          curve: Curves.easeIn,
        ),
      ),
    );
    _step2BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: startBlur, end: finalBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(finalBlur), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: finalBlur, end: startBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.2,
          0.4,
        ),
      ),
    );
    _step3PositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.4,
          0.6,
          curve: Curves.easeIn,
        ),
      ),
    );
    _step3BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: startBlur, end: finalBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(finalBlur), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: finalBlur, end: startBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.4,
          0.6,
        ),
      ),
    );
    _step4PositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.6,
          0.8,
          curve: Curves.easeIn,
        ),
      ),
    );
    _step4BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: startBlur, end: finalBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(finalBlur), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: finalBlur, end: startBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.6,
          0.8,
        ),
      ),
    );
    _step5PositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.8,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    _step5BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: startBlur, end: finalBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(finalBlur), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: finalBlur, end: startBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.8,
          1.0,
        ),
      ),
    );

    _fallingIOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.6,
          0.68,
          curve: Curves.linear,
        ),
      ),
    );

    _fallingIPosition = TweenSequence([
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
        parent: _transformFController,
        curve: const Interval(
          0.6,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );

    _fallingIRotation = TweenSequence([
      TweenSequenceItem<double>(tween: ConstantTween<double>(1.0), weight: 0.2),
      TweenSequenceItem(
          tween: Tween(begin: 1.00, end: 3.0)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 0.25),
      // TweenSequenceItem<double>(tween: ConstantTween<double>(5.0), weight: 0.0),
    ]).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.6,
          1.0,
        ),
      ),
    );

    _iRectHeight = TweenSequence([
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
        parent: _transformFController,
        curve: const Interval(
          0.6,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );
    _startingController.forward();
    print('starting');
    _startingController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _startingController.forward(from: 0.3);
      }
    });
    _transformFController.addListener(() => setState(() {}));
    _startingController.addListener(() {
      setState(() {});
      print('checking');
      print(_startRotationAnimation.value);
      print(_startingController.value);
      if (_canTransform &&
          _startRotationAnimation.value > -0.001 &&
          _startRotationAnimation.value < 0.001) {
        _startingController.stop();

        _transformFController.forward();
      }
    });
  }

  @override
  void dispose() {
    _transformFController.dispose();
    _startingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(_startingController.value);
    //print(_canTransform);
    //для Flutter Web, т.к. в нем нельзя устанавливать значение 0
    //в blur sigmaX или sigmaY, открытая issue
    //https://github.com/flutter/flutter/issues/89433
    final step1Moving = _step2BlurAnimation.value > 0.001;
    final step0Moving = _step1BlurAnimation.value > 0.001;
//replace setState with animatedBuilder
    return LayoutBuilder(builder: (context, constraints) {
      final logoWidth = constraints.maxWidth;
      final logoHeight = logoWidth * 200 / 862;
      final bigSquareDiagonal = logoHeight;
      final bigSquareSide = bigSquareDiagonal / sqrt(2.0);
      final bigSquareDiagonalDiff = bigSquareSide / 2 * (sqrt(2.0) - 1);
      final smallSquareDiagonal = bigSquareDiagonal / squareScale;
      final smallSquareSide = bigSquareSide / squareScale;
      final borderRadius = smallSquareSide / 6.0;
      final smallSquareDiagonalDiff = bigSquareDiagonalDiff / squareScale;
      final horizontalDiagonalOffset =
          smallSquareSide * (1 + (sqrt(2) - 1)) * 0.9;

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Slider(
          //     value: _transformFController.value,
          //     onChanged: (value) => _transformFController.value = value),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     ElevatedButton(
          //         onPressed: () => _transformFController.reset(),
          //         child: const Text('Сбросить')),
          //     ElevatedButton(
          //         onPressed: () => _transformFController.forward(),
          //         child: const Text('Играть')),
          //     ElevatedButton(
          //         onPressed: () => _transformFController.forward(from: 0),
          //         child: const Text('Играть с начала')),
          //   ],
          // ),
          SizedBox(
            width: logoWidth,
            height: logoWidth * 200 / 862,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0.0,
                  right: bigSquareSide / 2.0 + bigSquareDiagonalDiff,
                  child: SizeTransition(
                    sizeFactor: _step1LogoPositionAnimation,
                    axis: Axis.horizontal,
                    axisAlignment: 1,
                    child: SizedBox(
                      width: logoWidth * 490 / 862,
                      height: logoWidth * 200 / 862,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SizedBox(
                            width: logoWidth * 490 / 862,
                            height: logoWidth * 132 / 862,
                            child: CustomPaint(
                              painter: FriflexIPainter(
                                iPointSymbolHeight: _fallingIPosition.value,
                                iRectHeight: _iRectHeight.value,
                                iPointSymbolRotation: _fallingIRotation.value,
                                iPointSymbolOpacity: _fallingIOpacity.value,
                                iRectColor: Colors.black,
                                dotColor: rectColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: logoWidth * 490 / 862,
                            height: logoWidth * 132 / 862,
                            child: SvgPicture.asset(
                              'assets/logo.svg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: _step1RectPositionAnimation.value *
                      (logoWidth / 2 - bigSquareDiagonal / 2),
                  bottom: 0,
                  child: Transform.scale(
                    scale: _startScaleAnimation.value,
                    child: SizedBox(
                      height: bigSquareDiagonal,
                      width: bigSquareDiagonal,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Transform.translate(
                            offset: Offset(
                                horizontalDiagonalOffset *
                                    _step4PositionAnimation.value,
                                -smallSquareSide /
                                    2.0 *
                                    squareScale *
                                    _step3PositionAnimation.value),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Transform.translate(
                                  offset: Offset(
                                      horizontalDiagonalOffset *
                                          _step5PositionAnimation.value,
                                      0),
                                  child: RectanglePart(
                                    color: rectColor,
                                    size: smallSquareSide,
                                    borderRadius: borderRadius,
                                    blurValue: _step5BlurAnimation.value,
                                  ),
                                ),
                                RectanglePart(
                                  color: rectColor,
                                  size: smallSquareSide,
                                  borderRadius: borderRadius,
                                  blurValue: _step4BlurAnimation.value,
                                ),
                              ],
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(
                                horizontalDiagonalOffset *
                                    _step4PositionAnimation.value,
                                0),
                            child: RectanglePart(
                              color: rectColor,
                              size: smallSquareSide,
                              borderRadius: borderRadius,
                              blurValue: _step4BlurAnimation.value,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(
                                0,
                                -smallSquareSide /
                                    2.0 *
                                    squareScale *
                                    _step3PositionAnimation.value),
                            child: RectangleSmall(
                              color: rectColor,
                              size: smallSquareSide,
                              borderRadius: borderRadius,
                              blurValue: _step3BlurAnimation.value,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(
                                0,
                                smallSquareSide /
                                    2.0 *
                                    squareScale *
                                    _step3PositionAnimation.value),
                            child: RectangleSmall(
                              color: rectColor,
                              size: smallSquareSide,
                              borderRadius: borderRadius,
                              blurValue: _step3BlurAnimation.value,
                            ),
                          ),
                          Transform.scale(
                            scale: _step2ScaleAnimation.value,
                            child: Transform.rotate(
                              angle: pi / 4 + _startRotationAnimation.value,
                              child: SizedBox(
                                height: smallSquareSide * 1.1,
                                width: smallSquareSide * 1.1,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Transform.scale(
                                      scale: _glowSizeAnimation.value,
                                      child: Container(
                                        height: smallSquareSide,
                                        width: smallSquareSide,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              borderRadius),
                                          color: rectColor.withOpacity(
                                              _glowOpacityAnimation.value),
                                        ),
                                      ),
                                    ),
                                    Transform.scale(
                                      scale: _glowSizeAnimation.value - 0.4,
                                      child: Container(
                                        height: smallSquareSide,
                                        width: smallSquareSide,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              borderRadius),
                                          color: rectColor.withOpacity(
                                              _glowOpacityAnimation.value),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => _canTransform = true,
                                      child: Container(
                                        height: smallSquareSide,
                                        width: smallSquareSide,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              borderRadius),
                                          color: rectColor,
                                        ),
                                      ),
                                    ),
                                    if (step0Moving)
                                      ClipRect(
                                        //try to use ImageFilter instead
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: _step1BlurAnimation.value,
                                              sigmaY:
                                                  _step1BlurAnimation.value),
                                          child: Container(
                                            height: smallSquareSide * 1.1,
                                            width: smallSquareSide * 1.1,
                                            color: Colors.black.withOpacity(0),
                                          ),
                                        ),
                                      ),
                                    if (step1Moving)
                                      ClipRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: _step2BlurAnimation.value,
                                              sigmaY:
                                                  _step2BlurAnimation.value),
                                          child: Container(
                                            height: smallSquareSide * 1.1,
                                            width: smallSquareSide * 1.1,
                                            color: Colors.black.withOpacity(0),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class RectanglePart extends StatelessWidget {
  const RectanglePart({
    Key? key,
    required this.size,
    required this.blurValue,
    required this.borderRadius,
    required this.color,
  }) : super(key: key);

  static const rotation = pi / 4;
  static const blurOversize = 1.1;
  static const blurThreshold = 0.001;

  final Color color;
  final double size;
  final double borderRadius;
  final double blurValue;

  @override
  Widget build(BuildContext context) {
    final bool isBlur = blurValue > blurThreshold;
    return Transform.rotate(
      angle: rotation,
      child: SizedBox(
        height: size * blurOversize,
        width: size * blurOversize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: size,
              width: size,
              child: CustomPaint(
                painter: CuttedRectanglePainter(
                    borderRadius: borderRadius, color: color),
              ),
            ),
            if (isBlur)
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: blurValue,
                    sigmaY: blurValue,
                  ),
                  child: Container(
                    height: size * blurOversize,
                    width: size * blurOversize,
                    color: Colors.black.withOpacity(0),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class RectangleSmall extends StatelessWidget {
  const RectangleSmall({
    Key? key,
    required this.blurValue,
    required this.size,
    required this.borderRadius,
    required this.color,
  }) : super(key: key);

  static const rotation = pi / 4;
  static const blurOversize = 1.1;
  static const blurThreshold = 0.001;

  final Color color;
  final double size;
  final double borderRadius;
  final double blurValue;

  @override
  Widget build(BuildContext context) {
    final bool isBlur = blurValue > blurThreshold;
    return Transform.rotate(
      angle: rotation,
      child: SizedBox(
        height: size * blurOversize,
        width: size * blurOversize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: color),
            ),
            if (isBlur)
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: blurValue,
                    sigmaY: blurValue,
                  ),
                  child: Container(
                    height: size * blurOversize,
                    width: size * blurOversize,
                    color: Colors.black.withOpacity(0),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class CuttedRectanglePainter extends CustomPainter {
  final double borderRadius;
  final Color color;

  CuttedRectanglePainter({required this.color, required this.borderRadius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()
          ..addRRect(RRect.fromLTRBR(
              0, 0, size.width, size.height, Radius.circular(borderRadius))),
        Path()
          ..addRRect(RRect.fromLTRBAndCorners(
              0, size.height * 0.3, size.width * 0.7, size.height,
              topRight: Radius.circular(borderRadius))),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class FriflexIPainter extends CustomPainter {
  final double iPointSymbolHeight;
  final double iPointSymbolOpacity;
  final double iPointSymbolRotation;
  final double iRectHeight;
  final Color dotColor;
  final Color iRectColor;

  FriflexIPainter({
    required this.iPointSymbolOpacity,
    required this.iPointSymbolRotation,
    required this.iPointSymbolHeight,
    required this.iRectHeight,
    required this.dotColor,
    required this.iRectColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // i base symbol
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(
          size.width * 249 / 762,
          size.height * (205 - 135) / 205 * iRectHeight,
          size.width * 282 / 762,
          size.height,
          topLeft: Radius.circular(size.width * 0.01),
          topRight: Radius.circular(size.width * 0.01),
        ),
        Paint()
          ..color = iRectColor
          ..style = PaintingStyle.fill);

    // i dot symbol
    final iPointSymbolScale = (iPointSymbolHeight + 4) * 0.25;

    canvas.save();

    final radius = size.width * ((282 - 249) / 2 / 762);
    final diagonal = radius - 1 / 2 * radius * (sqrt(2.0) - 1);

    canvas.translate(
        0,
        iPointSymbolHeight * ((size.height * (205 - 135) / 205)) -
            diagonal * iPointSymbolScale);

    canvas.translate(size.width * (249 + (282 - 249) / 2) / 762, 0);
    canvas.rotate(45 * pi / 180 * iPointSymbolRotation);
    canvas.scale(iPointSymbolScale);
    canvas.translate(-size.width * (249 + (282 - 249) / 2) / 762, 0);

    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCircle(
            center: Offset(size.width * (249 + (282 - 249) / 2) / 762, 0),
            radius: diagonal,
          ),
          Radius.circular(size.width * 0.012),
        ),
        Paint()
          ..color = dotColor.withOpacity(iPointSymbolOpacity)
          ..style = PaintingStyle.fill);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

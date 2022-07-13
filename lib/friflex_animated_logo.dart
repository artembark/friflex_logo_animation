import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'custom_curves.dart';

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
    with SingleTickerProviderStateMixin {
  late AnimationController _transformFController;
  late Animation _step0PositionAnimation;
  late Animation _step0LogoPositionAnimation;
  late Animation _step0BlurAnimation;
  late Animation _step1ScaleAnimation;
  late Animation _step1BlurAnimation;
  late Animation _step2PositionAnimation;
  late Animation _step2BlurAnimation;
  late Animation _step3PositionAnimation;
  late Animation _step3BlurAnimation;
  late Animation _step4PositionAnimation;
  late Animation _step4BlurAnimation;
  late Animation _fallingIPosition;
  late Animation _fallingIScale;
  late Animation _fallingIRotation;
  late Animation _fallingIOpacity;
  late Animation _iRectHeight;
  final blurValue = 0.15;
  final startBlur = 0.0;
  final squareScale = 3.5;
  final sliderValue = 0;

  @override
  void initState() {
    super.initState();
    _transformFController =
        AnimationController(vsync: this, duration: widget.duration);
    _step0PositionAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.0,
          0.18,
          curve: Curves.easeIn,
        ),
      ),
    );
    _step0LogoPositionAnimation =
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
    _step0BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: startBlur, end: blurValue)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(blurValue), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: blurValue, end: startBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.0,
          0.2,
          curve: Curves.linear,
        ),
      ),
    );
    _step1ScaleAnimation = Tween<double>(begin: squareScale, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.2,
          0.4,
          curve: Curves.easeIn,
        ),
      ),
    );
    _step1BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: startBlur, end: blurValue)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(blurValue), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: blurValue, end: startBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.2,
          0.4,
          curve: Curves.linear,
        ),
      ),
    );
    _step2PositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.4,
          0.6,
          curve: Curves.easeIn,
        ),
      ),
    );
    _step2BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: startBlur, end: blurValue)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(blurValue), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: blurValue, end: startBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.4,
          0.6,
          curve: Curves.linear,
        ),
      ),
    );
    _step3PositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.6,
          0.8,
          curve: Curves.easeIn,
        ),
      ),
    );
    _step3BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: startBlur, end: blurValue)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(blurValue), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: blurValue, end: startBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.6,
          0.8,
          curve: Curves.linear,
        ),
      ),
    );
    _step4PositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.8,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    _step4BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: startBlur, end: blurValue)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(blurValue), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: blurValue, end: startBlur)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: const Interval(
          0.8,
          1.0,
          curve: Curves.linear,
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

    _fallingIScale = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 1.0, end: 1.4)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.15),
      //TweenSequenceItem<double>(tween: ConstantTween<double>(1.3), weight: 0.2),
      TweenSequenceItem(
          tween: Tween(begin: 1.4, end: 1.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.25)
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
          curve: Curves.linear,
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

    _transformFController.addListener(() => setState(() {}));
    _transformFController.forward(from: 0.5);
  }

  @override
  void dispose() {
    _transformFController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_step0PositionAnimation.value);
    //для Flutter Web, т.к. в нем нельзя устанавливать значение 0
    //в blur sigmaX или sigmaY, открытая issue
    //https://github.com/flutter/flutter/issues/89433
    final step1Moving = _step1BlurAnimation.value > 0.001;
    final step0Moving = _step0BlurAnimation.value > 0.001;
//replace setState with animatedBuilder
    return LayoutBuilder(builder: (context, constraints) {
      final bigSquareDiagonal = constraints.maxWidth * 200 / 862;
      final bigSquareSide = bigSquareDiagonal / sqrt(2.0);
      final bigSquareDifference = bigSquareSide / 2 * (sqrt(2.0) - 1);
      final smallSquareDiagonal = bigSquareDiagonal / squareScale;
      final smallSquareSide = bigSquareSide / squareScale;
      final borderRadius = smallSquareSide / 6.0;
      final smallSquareDifference = bigSquareDifference / squareScale;
      final horizontalDiagonalOffset =
          smallSquareSide * (1 + (sqrt(2) - 1)) * 0.9;
      final logoWidth = constraints.maxWidth;
      return Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
                radius: 1.8,
                center: Alignment.topLeft,
                colors: [Color(0xFFEBDAFF), Colors.green])),
        child: Column(
          children: [
            Slider(
                value: _transformFController.value,
                onChanged: (value) => _transformFController.value = value),
            Text(_transformFController.value.toString()),
            Text(_fallingIPosition.value.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => _transformFController.reset(),
                    child: const Text('Сбросить')),
                ElevatedButton(
                    onPressed: () => _transformFController.forward(),
                    child: const Text('Играть')),
                ElevatedButton(
                    onPressed: () => _transformFController.forward(from: 0),
                    child: const Text('Играть с начала')),
              ],
            ),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.yellow,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Container();
                  }),
                ),
                Container(
                  width: MediaQuery.of(context).size.width -
                      bigSquareSide / 2.0 -
                      bigSquareDifference,
                  color: Colors.blue,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Container();
                  }),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.red,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Container();
                  }),
                ),
                Container(
                  width: bigSquareSide / 2.0 + bigSquareDifference,
                  color: Colors.green,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Container();
                  }),
                ),
                // Container(
                //   width: logoWidth,
                //   color: Colors.white,
                //   child: LayoutBuilder(builder: (context, constraints) {
                //     return Container();
                //   }),
                // ),
                Center(
                  child: SizedBox(
                    width: logoWidth,
                    height: logoWidth * 200 / 862,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0.0,
                          right: bigSquareSide / 2.0 + bigSquareDifference,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: logoWidth * 490 / 862,
                                height: logoWidth * 490 / 862 * 132 / 490,
                                child: CustomPaint(
                                  painter: FriflexPainter(
                                      iPointSymbolHeight:
                                          _fallingIPosition.value,
                                      iPointSymbolScale: _fallingIScale.value,
                                      iRectHeight: _iRectHeight.value,
                                      iPointSymbolRotation:
                                          _fallingIRotation.value,
                                      iPointSymbolOpacity:
                                          _fallingIOpacity.value),
                                ),
                              ),
                              Positioned(
                                left: 0.0,
                                bottom: 0.0,
                                child: Container(
                                  width: logoWidth *
                                      490 /
                                      862 *
                                      _step0PositionAnimation.value *
                                      1.1,
                                  height:
                                      logoWidth * 490 / 862 * 132 / 490 * 1.2,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          left: _step0LogoPositionAnimation.value *
                              (logoWidth / 2 - bigSquareDiagonal / 2),
                          bottom: 0,
                          child: SizedBox(
                            height: bigSquareDiagonal,
                            width: bigSquareDiagonal,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Transform.translate(
                                  offset: Offset(
                                      horizontalDiagonalOffset *
                                          _step3PositionAnimation.value,
                                      -smallSquareSide /
                                          2.0 *
                                          squareScale *
                                          _step2PositionAnimation.value),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Transform.translate(
                                        offset: Offset(
                                            horizontalDiagonalOffset *
                                                _step4PositionAnimation.value,
                                            0),
                                        child: RectanglePart(
                                          size: smallSquareSide,
                                          scale: _step1ScaleAnimation.value,
                                          borderRadius: borderRadius,
                                          blurValue: _step4BlurAnimation.value,
                                        ),
                                      ),
                                      RectanglePart(
                                        size: smallSquareSide,
                                        scale: _step1ScaleAnimation.value,
                                        borderRadius: borderRadius,
                                        blurValue: _step3BlurAnimation.value,
                                      ),
                                    ],
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(
                                      horizontalDiagonalOffset *
                                          _step3PositionAnimation.value,
                                      0),
                                  child: RectanglePart(
                                    size: smallSquareSide,
                                    scale: _step1ScaleAnimation.value,
                                    borderRadius: borderRadius,
                                    blurValue: _step3BlurAnimation.value,
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(
                                      0,
                                      -smallSquareSide /
                                          2.0 *
                                          squareScale *
                                          _step2PositionAnimation.value),
                                  child: RectangleSmall(
                                    size: smallSquareSide,
                                    scale: _step1ScaleAnimation.value,
                                    borderRadius: borderRadius,
                                    blurValue: _step2BlurAnimation.value,
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(
                                      0,
                                      smallSquareSide /
                                          2.0 *
                                          squareScale *
                                          _step2PositionAnimation.value),
                                  child: RectangleSmall(
                                    size: smallSquareSide,
                                    scale: _step1ScaleAnimation.value,
                                    borderRadius: borderRadius,
                                    blurValue: _step2BlurAnimation.value,
                                  ),
                                ),
                                Transform.scale(
                                  scale: _step1ScaleAnimation.value,
                                  child: Transform.rotate(
                                    angle: pi / 4,
                                    child: SizedBox(
                                      height: smallSquareSide * 1.1,
                                      width: smallSquareSide * 1.1,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Center(
                                            child: InkWell(
                                              onTap: () => _transformFController
                                                  .forward(),
                                              child: Container(
                                                height: smallSquareSide,
                                                width: smallSquareSide,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          borderRadius),
                                                  color:
                                                      const Color(0xff685bc7),
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (step0Moving)
                                            ClipRect(
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: _step0BlurAnimation
                                                        .value,
                                                    sigmaY: _step0BlurAnimation
                                                        .value),
                                                child: Container(
                                                  height: smallSquareSide * 1.1,
                                                  width: smallSquareSide * 1.1,
                                                  color: Colors.black
                                                      .withOpacity(0),
                                                ),
                                              ),
                                            ),
                                          if (step1Moving)
                                            ClipRect(
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: _step1BlurAnimation
                                                        .value,
                                                    sigmaY: _step1BlurAnimation
                                                        .value),
                                                child: Container(
                                                  height: smallSquareSide * 1.1,
                                                  width: smallSquareSide * 1.1,
                                                  color: Colors.black
                                                      .withOpacity(0),
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class RectanglePart extends StatelessWidget {
  const RectanglePart({
    Key? key,
    required this.size,
    required this.blurValue,
    required this.scale,
    required this.borderRadius,
  }) : super(key: key);

  final double size;
  final double scale;
  final double borderRadius;
  final double blurValue;

  @override
  Widget build(BuildContext context) {
    final bool isBlur = blurValue > 0.001;
    return Transform.scale(
      scale: scale,
      child: Transform.rotate(
        angle: pi / 4,
        child: SizedBox(
          height: size * 1.1,
          width: size * 1.1,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: size,
                width: size,
                child: CustomPaint(
                  painter: CuttedRectanglePainter(
                      borderRadius: borderRadius,
                      color: const Color(0xff685bc7)),
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
                      height: size * 1.1,
                      width: size * 1.1,
                      color: Colors.black.withOpacity(0),
                    ),
                  ),
                )
            ],
          ),
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
    required this.scale,
    required this.borderRadius,
  }) : super(key: key);

  final double size;
  final double scale;
  final double borderRadius;
  final double blurValue;

  @override
  Widget build(BuildContext context) {
    final bool isBlur = blurValue > 0.001;
    return Transform.scale(
      scale: scale,
      child: Transform.rotate(
        angle: pi / 4,
        child: SizedBox(
          height: size * 1.1,
          width: size * 1.1,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: const Color(0xff685bc7)),
              ),
              if (isBlur)
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: blurValue,
                      sigmaY: blurValue,
                    ),
                    child: Container(
                      height: size * 1.1,
                      width: size * 1.1,
                      color: Colors.black.withOpacity(0),
                    ),
                  ),
                )
            ],
          ),
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

class FriflexPainter extends CustomPainter {
  final double iPointSymbolHeight;
  final double iPointSymbolScale;
  final double iPointSymbolOpacity;
  final double iRectHeight;
  final double iPointSymbolRotation;

  FriflexPainter(
      {required this.iPointSymbolOpacity,
      required this.iPointSymbolScale,
      required this.iRectHeight,
      required this.iPointSymbolRotation,
      required this.iPointSymbolHeight});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // F symbol
    paint.color = const Color(0xff1f1f1f);
    path = Path();
    path.lineTo(size.width * 0.16, 0);
    path.cubicTo(size.width * 0.17, 0, size.width * 0.18, size.height * 0.03,
        size.width * 0.18, size.height * 0.05);
    path.cubicTo(size.width * 0.18, size.height * 0.05, size.width * 0.18,
        size.height * 0.12, size.width * 0.18, size.height * 0.12);
    path.cubicTo(size.width * 0.18, size.height * 0.15, size.width * 0.17,
        size.height * 0.17, size.width * 0.16, size.height * 0.17);
    path.cubicTo(size.width * 0.16, size.height * 0.17, size.width * 0.09,
        size.height * 0.17, size.width * 0.09, size.height * 0.17);
    path.cubicTo(size.width * 0.09, size.height * 0.17, size.width * 0.06,
        size.height * 0.17, size.width * 0.06, size.height * 0.17);
    path.cubicTo(size.width * 0.06, size.height * 0.17, size.width * 0.06,
        size.height * 0.17, size.width * 0.06, size.height * 0.17);
    path.cubicTo(size.width * 0.06, size.height * 0.17, size.width * 0.06,
        size.height * 0.17, size.width * 0.06, size.height * 0.17);
    path.cubicTo(size.width * 0.06, size.height * 0.17, size.width * 0.06,
        size.height * 0.17, size.width * 0.06, size.height * 0.17);
    path.cubicTo(size.width * 0.05, size.height * 0.17, size.width * 0.04,
        size.height * 0.19, size.width * 0.04, size.height * 0.22);
    path.cubicTo(size.width * 0.04, size.height * 0.22, size.width * 0.04,
        size.height * 0.22, size.width * 0.04, size.height * 0.22);
    path.cubicTo(size.width * 0.04, size.height * 0.22, size.width * 0.04,
        size.height * 0.42, size.width * 0.04, size.height * 0.42);
    path.cubicTo(size.width * 0.04, size.height * 0.42, size.width * 0.12,
        size.height * 0.42, size.width * 0.12, size.height * 0.42);
    path.cubicTo(size.width * 0.13, size.height * 0.42, size.width * 0.13,
        size.height * 0.44, size.width * 0.13, size.height * 0.47);
    path.cubicTo(size.width * 0.13, size.height * 0.47, size.width * 0.13,
        size.height * 0.53, size.width * 0.13, size.height * 0.53);
    path.cubicTo(size.width * 0.13, size.height * 0.56, size.width * 0.13,
        size.height * 0.58, size.width * 0.12, size.height * 0.58);
    path.cubicTo(size.width * 0.12, size.height * 0.58, size.width * 0.06,
        size.height * 0.58, size.width * 0.06, size.height * 0.58);
    path.cubicTo(size.width * 0.06, size.height * 0.58, size.width * 0.06,
        size.height * 0.58, size.width * 0.06, size.height * 0.58);
    path.cubicTo(size.width * 0.05, size.height * 0.58, size.width * 0.04,
        size.height * 0.61, size.width * 0.04, size.height * 0.63);
    path.cubicTo(size.width * 0.04, size.height * 0.63, size.width * 0.04,
        size.height * 0.64, size.width * 0.04, size.height * 0.64);
    path.cubicTo(size.width * 0.04, size.height * 0.64, size.width * 0.04,
        size.height, size.width * 0.04, size.height);
    path.cubicTo(size.width * 0.04, size.height, size.width * 0.04, size.height,
        size.width * 0.04, size.height);
    path.cubicTo(
        size.width * 0.04, size.height, 0, size.height, 0, size.height);
    path.cubicTo(0, size.height, 0, size.height, 0, size.height);
    path.cubicTo(0, size.height, 0, size.height * 0.53, 0, size.height * 0.53);
    path.cubicTo(
        0, size.height * 0.53, 0, size.height * 0.47, 0, size.height * 0.47);
    path.cubicTo(
        0, size.height * 0.47, 0, size.height * 0.17, 0, size.height * 0.17);
    path.cubicTo(
        0, size.height * 0.17, 0, size.height * 0.17, 0, size.height * 0.17);
    path.cubicTo(
        0, size.height * 0.17, 0, size.height * 0.17, 0, size.height * 0.17);
    path.cubicTo(
        0, size.height * 0.08, size.width * 0.02, 0, size.width * 0.04, 0);
    path.cubicTo(
        size.width * 0.04, 0, size.width * 0.05, 0, size.width * 0.05, 0);
    path.cubicTo(
        size.width * 0.05, 0, size.width * 0.05, 0, size.width * 0.05, 0);
    path.cubicTo(
        size.width * 0.05, 0, size.width * 0.16, 0, size.width * 0.16, 0);
    canvas.drawPath(path, paint);

    // r symbol
    paint.color = const Color(0xff1f1f1f);
    path = Path();
    path.lineTo(size.width * 0.29, size.height * 0.38);
    path.cubicTo(size.width * 0.29, size.height * 0.38, size.width * 0.29,
        size.height * 0.46, size.width * 0.29, size.height * 0.46);
    path.cubicTo(size.width * 0.29, size.height * 0.48, size.width * 0.29,
        size.height / 2, size.width * 0.28, size.height / 2);
    path.cubicTo(size.width * 0.28, size.height / 2, size.width * 0.27,
        size.height / 2, size.width * 0.27, size.height / 2);
    path.cubicTo(size.width * 0.27, size.height / 2, size.width * 0.27,
        size.height / 2, size.width * 0.27, size.height / 2);
    path.cubicTo(size.width * 0.24, size.height / 2, size.width * 0.22,
        size.height * 0.58, size.width * 0.22, size.height * 0.67);
    path.cubicTo(size.width * 0.22, size.height * 0.67, size.width * 0.22,
        size.height * 0.7, size.width * 0.22, size.height * 0.7);
    path.cubicTo(size.width * 0.22, size.height * 0.7, size.width * 0.22,
        size.height * 0.7, size.width * 0.22, size.height * 0.7);
    path.cubicTo(size.width * 0.22, size.height * 0.71, size.width * 0.22,
        size.height * 0.71, size.width * 0.22, size.height * 0.71);
    path.cubicTo(size.width * 0.22, size.height * 0.71, size.width * 0.22,
        size.height, size.width * 0.22, size.height);
    path.cubicTo(size.width * 0.22, size.height, size.width * 0.22, size.height,
        size.width * 0.22, size.height);
    path.cubicTo(size.width * 0.22, size.height, size.width * 0.18, size.height,
        size.width * 0.18, size.height);
    path.cubicTo(size.width * 0.18, size.height, size.width * 0.18, size.height,
        size.width * 0.18, size.height);
    path.cubicTo(size.width * 0.18, size.height, size.width * 0.18,
        size.height * 0.44, size.width * 0.18, size.height * 0.44);
    path.cubicTo(size.width * 0.18, size.height * 0.38, size.width * 0.19,
        size.height * 0.34, size.width / 5, size.height * 0.34);
    path.cubicTo(size.width / 5, size.height * 0.34, size.width * 0.22,
        size.height * 0.34, size.width * 0.22, size.height * 0.34);
    path.cubicTo(size.width * 0.22, size.height * 0.34, size.width * 0.22,
        size.height * 0.4, size.width * 0.22, size.height * 0.4);
    path.cubicTo(size.width * 0.23, size.height * 0.34, size.width / 4,
        size.height * 0.34, size.width * 0.26, size.height * 0.34);
    path.cubicTo(size.width * 0.26, size.height * 0.34, size.width * 0.28,
        size.height * 0.34, size.width * 0.28, size.height * 0.34);
    path.cubicTo(size.width * 0.29, size.height * 0.34, size.width * 0.29,
        size.height * 0.35, size.width * 0.29, size.height * 0.38);
    path.cubicTo(size.width * 0.29, size.height * 0.38, size.width * 0.29,
        size.height * 0.38, size.width * 0.29, size.height * 0.38);
    canvas.drawPath(path, paint);

    // i base symbol
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(
          size.width * 253 / 762,
          size.height * (205 - 135) / 205 * iRectHeight,
          size.width * 282 / 762,
          size.height,
          topLeft: Radius.circular(size.width * 0.01),
          topRight: Radius.circular(size.width * 0.01),
        ),
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.fill);

    canvas.save();
    //refactor scaling
    final iPointSymbolScale1 = (iPointSymbolHeight + 4) * 0.25;
    void rotate(
        {required Canvas canvas,
        required double cx,
        required double cy,
        required double angle}) {
      canvas.translate(cx, cy);
      canvas.rotate(angle);
      canvas.scale(iPointSymbolScale1);
      canvas.translate(-cx, -cy);
    }

    final radius = size.width * ((282 - 253) / 2 / 762);
    final diagonal = radius - 1 / 2 * radius * (sqrt(2.0) - 1);

    canvas.translate(
        0,
        iPointSymbolHeight * ((size.height * (205 - 135) / 205)) -
            diagonal * iPointSymbolScale1);

    rotate(
        canvas: canvas,
        cx: size.width * (253 + (282 - 253) / 2) / 762,
        cy: 0,
        angle: 45 * pi / 180 * iPointSymbolRotation);

    // i dot symbol
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCircle(
              center: Offset(size.width * (253 + (282 - 253) / 2) / 762, 0),
              radius: diagonal,
            ),
            Radius.circular(size.width * 0.007)),
        Paint()
          ..color = const Color(0xff685bc7).withOpacity(iPointSymbolOpacity)
          ..style = PaintingStyle.fill);
    canvas.restore();

    // f symbol
    paint.color = const Color(0xff1f1f1f);
    path = Path();
    path.lineTo(size.width * 0.49, size.height * 0.17);
    path.cubicTo(size.width * 0.49, size.height * 0.17, size.width * 0.49,
        size.height * 0.17, size.width * 0.49, size.height * 0.17);
    path.cubicTo(size.width * 0.49, size.height * 0.17, size.width * 0.51,
        size.height * 0.17, size.width * 0.51, size.height * 0.17);
    path.cubicTo(size.width * 0.52, size.height * 0.17, size.width * 0.52,
        size.height * 0.15, size.width * 0.52, size.height * 0.12);
    path.cubicTo(size.width * 0.52, size.height * 0.12, size.width * 0.52,
        size.height * 0.05, size.width * 0.52, size.height * 0.05);
    path.cubicTo(size.width * 0.52, size.height * 0.03, size.width * 0.52, 0,
        size.width * 0.51, 0);
    path.cubicTo(
        size.width * 0.51, 0, size.width * 0.48, 0, size.width * 0.48, 0);
    path.cubicTo(
        size.width * 0.48, 0, size.width * 0.48, 0, size.width * 0.48, 0);
    path.cubicTo(
        size.width * 0.48, 0, size.width * 0.48, 0, size.width * 0.48, 0);
    path.cubicTo(size.width * 0.45, 0, size.width * 0.43, size.height * 0.08,
        size.width * 0.43, size.height * 0.17);
    path.cubicTo(size.width * 0.43, size.height * 0.17, size.width * 0.43,
        size.height * 0.34, size.width * 0.43, size.height * 0.34);
    path.cubicTo(size.width * 0.43, size.height * 0.34, size.width * 0.42,
        size.height * 0.34, size.width * 0.42, size.height * 0.34);
    path.cubicTo(size.width * 0.41, size.height * 0.34, size.width * 0.41,
        size.height * 0.36, size.width * 0.41, size.height * 0.38);
    path.cubicTo(size.width * 0.41, size.height * 0.38, size.width * 0.41,
        size.height * 0.45, size.width * 0.41, size.height * 0.45);
    path.cubicTo(size.width * 0.41, size.height * 0.48, size.width * 0.41,
        size.height / 2, size.width * 0.42, size.height / 2);
    path.cubicTo(size.width * 0.42, size.height / 2, size.width * 0.42,
        size.height / 2, size.width * 0.42, size.height / 2);
    path.cubicTo(size.width * 0.42, size.height / 2, size.width * 0.42,
        size.height / 2, size.width * 0.42, size.height / 2);
    path.cubicTo(size.width * 0.43, size.height / 2, size.width * 0.43,
        size.height * 0.52, size.width * 0.43, size.height * 0.55);
    path.cubicTo(size.width * 0.43, size.height * 0.55, size.width * 0.43,
        size.height * 0.55, size.width * 0.43, size.height * 0.55);
    path.cubicTo(size.width * 0.43, size.height * 0.55, size.width * 0.43,
        size.height, size.width * 0.43, size.height);
    path.cubicTo(size.width * 0.43, size.height, size.width * 0.44, size.height,
        size.width * 0.44, size.height);
    path.cubicTo(size.width * 0.44, size.height, size.width * 0.48, size.height,
        size.width * 0.48, size.height);
    path.cubicTo(size.width * 0.48, size.height, size.width * 0.48, size.height,
        size.width * 0.48, size.height);
    path.cubicTo(size.width * 0.48, size.height, size.width * 0.48,
        size.height * 0.55, size.width * 0.48, size.height * 0.55);
    path.cubicTo(size.width * 0.48, size.height * 0.55, size.width * 0.48,
        size.height * 0.55, size.width * 0.48, size.height * 0.55);
    path.cubicTo(size.width * 0.48, size.height * 0.52, size.width * 0.49,
        size.height / 2, size.width * 0.49, size.height / 2);
    path.cubicTo(size.width * 0.49, size.height / 2, size.width * 0.49,
        size.height / 2, size.width * 0.49, size.height / 2);
    path.cubicTo(size.width * 0.49, size.height / 2, size.width * 0.51,
        size.height / 2, size.width * 0.51, size.height / 2);
    path.cubicTo(size.width * 0.52, size.height / 2, size.width * 0.52,
        size.height * 0.48, size.width * 0.52, size.height * 0.45);
    path.cubicTo(size.width * 0.52, size.height * 0.45, size.width * 0.52,
        size.height * 0.38, size.width * 0.52, size.height * 0.38);
    path.cubicTo(size.width * 0.52, size.height * 0.36, size.width * 0.52,
        size.height * 0.34, size.width * 0.51, size.height * 0.34);
    path.cubicTo(size.width * 0.51, size.height * 0.34, size.width * 0.48,
        size.height * 0.34, size.width * 0.48, size.height * 0.34);
    path.cubicTo(size.width * 0.48, size.height * 0.34, size.width * 0.48,
        size.height * 0.22, size.width * 0.48, size.height * 0.22);
    path.cubicTo(size.width * 0.48, size.height * 0.22, size.width * 0.48,
        size.height * 0.22, size.width * 0.48, size.height * 0.22);
    path.cubicTo(size.width * 0.48, size.height * 0.19, size.width * 0.49,
        size.height * 0.17, size.width * 0.49, size.height * 0.17);
    path.cubicTo(size.width * 0.49, size.height * 0.17, size.width * 0.49,
        size.height * 0.17, size.width * 0.49, size.height * 0.17);
    canvas.drawPath(path, paint);

    // l symbol
    paint.color = const Color(0xff1f1f1f);
    path = Path();
    path.lineTo(size.width * 0.56, size.height * 0.05);
    path.cubicTo(size.width * 0.56, size.height * 0.03, size.width * 0.57, 0,
        size.width * 0.57, 0);
    path.cubicTo(
        size.width * 0.57, 0, size.width * 0.59, 0, size.width * 0.59, 0);
    path.cubicTo(size.width * 0.6, 0, size.width * 0.6, size.height * 0.03,
        size.width * 0.6, size.height * 0.05);
    path.cubicTo(size.width * 0.6, size.height * 0.05, size.width * 0.6,
        size.height, size.width * 0.6, size.height);
    path.cubicTo(size.width * 0.6, size.height, size.width * 0.6, size.height,
        size.width * 0.6, size.height);
    path.cubicTo(size.width * 0.6, size.height, size.width * 0.56, size.height,
        size.width * 0.56, size.height);
    path.cubicTo(size.width * 0.56, size.height, size.width * 0.56, size.height,
        size.width * 0.56, size.height);
    path.cubicTo(size.width * 0.56, size.height, size.width * 0.56,
        size.height * 0.05, size.width * 0.56, size.height * 0.05);
    canvas.drawPath(path, paint);

    // e symbol
    paint.color = const Color(0xff1f1f1f);
    path = Path();
    path.moveTo(size.width * 0.73, size.height * 0.84);
    path.cubicTo(size.width * 0.74, size.height * 0.84, size.width * 0.75,
        size.height * 0.82, size.width * 0.76, size.height * 0.8);
    path.cubicTo(size.width * 0.76, size.height * 0.8, size.width * 0.76,
        size.height * 0.8, size.width * 0.76, size.height * 0.8);
    path.cubicTo(size.width * 0.76, size.height * 0.8, size.width * 0.79,
        size.height * 0.86, size.width * 0.79, size.height * 0.86);
    path.cubicTo(size.width * 0.79, size.height * 0.86, size.width * 0.8,
        size.height * 0.88, size.width * 0.79, size.height * 0.89);
    path.cubicTo(size.width * 0.78, size.height * 0.94, size.width * 0.76,
        size.height, size.width * 0.73, size.height);
    path.cubicTo(size.width * 0.68, size.height, size.width * 0.64,
        size.height * 0.85, size.width * 0.64, size.height * 0.67);
    path.cubicTo(size.width * 0.64, size.height * 0.49, size.width * 0.68,
        size.height * 0.34, size.width * 0.73, size.height * 0.34);
    path.cubicTo(size.width * 0.77, size.height * 0.34, size.width * 0.81,
        size.height * 0.49, size.width * 0.81, size.height * 0.67);
    path.cubicTo(size.width * 0.81, size.height * 0.68, size.width * 0.81,
        size.height * 0.7, size.width * 0.81, size.height * 0.71);
    path.cubicTo(size.width * 0.81, size.height * 0.72, size.width * 0.81,
        size.height * 0.73, size.width * 0.81, size.height * 0.73);
    path.cubicTo(size.width * 0.81, size.height * 0.73, size.width * 0.68,
        size.height * 0.73, size.width * 0.68, size.height * 0.73);
    path.cubicTo(size.width * 0.68, size.height * 0.73, size.width * 0.68,
        size.height * 0.74, size.width * 0.68, size.height * 0.74);
    path.cubicTo(size.width * 0.69, size.height * 0.8, size.width * 0.71,
        size.height * 0.84, size.width * 0.73, size.height * 0.84);
    path.cubicTo(size.width * 0.73, size.height * 0.84, size.width * 0.73,
        size.height * 0.84, size.width * 0.73, size.height * 0.84);
    path.lineTo(size.width * 0.68, size.height * 0.6);
    path.cubicTo(size.width * 0.68, size.height * 0.6, size.width * 0.68,
        size.height * 0.61, size.width * 0.68, size.height * 0.61);
    path.cubicTo(size.width * 0.68, size.height * 0.61, size.width * 0.77,
        size.height * 0.61, size.width * 0.77, size.height * 0.61);
    path.cubicTo(size.width * 0.77, size.height * 0.61, size.width * 0.77,
        size.height * 0.6, size.width * 0.77, size.height * 0.6);
    path.cubicTo(size.width * 0.76, size.height * 0.54, size.width * 0.74,
        size.height * 0.49, size.width * 0.73, size.height * 0.49);
    path.cubicTo(size.width * 0.71, size.height * 0.49, size.width * 0.69,
        size.height * 0.54, size.width * 0.68, size.height * 0.6);
    path.cubicTo(size.width * 0.68, size.height * 0.6, size.width * 0.68,
        size.height * 0.6, size.width * 0.68, size.height * 0.6);
    canvas.drawPath(path, paint);

    // x symbol
    paint.color = const Color(0xff1f1f1f);
    path = Path();
    path.lineTo(size.width * 0.84, size.height * 0.34);
    path.cubicTo(size.width * 0.83, size.height * 0.34, size.width * 0.83,
        size.height * 0.38, size.width * 0.83, size.height * 0.41);
    path.cubicTo(size.width * 0.83, size.height * 0.41, size.width * 0.88,
        size.height * 0.67, size.width * 0.88, size.height * 0.67);
    path.cubicTo(size.width * 0.88, size.height * 0.67, size.width * 0.82,
        size.height * 0.98, size.width * 0.82, size.height * 0.98);
    path.cubicTo(size.width * 0.82, size.height, size.width * 0.82, size.height,
        size.width * 0.82, size.height);
    path.cubicTo(size.width * 0.82, size.height, size.width * 0.87, size.height,
        size.width * 0.87, size.height);
    path.cubicTo(size.width * 0.87, size.height, size.width * 0.87, size.height,
        size.width * 0.87, size.height);
    path.cubicTo(size.width * 0.87, size.height, size.width * 0.91,
        size.height * 0.8, size.width * 0.91, size.height * 0.8);
    path.cubicTo(size.width * 0.91, size.height * 0.8, size.width * 0.95,
        size.height, size.width * 0.95, size.height);
    path.cubicTo(size.width * 0.95, size.height, size.width * 0.95, size.height,
        size.width * 0.95, size.height);
    path.cubicTo(size.width * 0.95, size.height, size.width, size.height,
        size.width, size.height);
    path.cubicTo(size.width, size.height, size.width, size.height, size.width,
        size.height * 0.98);
    path.cubicTo(size.width, size.height * 0.98, size.width * 0.94,
        size.height * 0.67, size.width * 0.94, size.height * 0.67);
    path.cubicTo(size.width * 0.94, size.height * 0.67, size.width,
        size.height * 0.41, size.width, size.height * 0.41);
    path.cubicTo(size.width, size.height * 0.38, size.width, size.height * 0.34,
        size.width * 0.98, size.height * 0.34);
    path.cubicTo(size.width * 0.98, size.height * 0.34, size.width * 0.96,
        size.height * 0.34, size.width * 0.96, size.height * 0.34);
    path.cubicTo(size.width * 0.95, size.height * 0.34, size.width * 0.95,
        size.height * 0.34, size.width * 0.95, size.height * 0.36);
    path.cubicTo(size.width * 0.95, size.height * 0.36, size.width * 0.91,
        size.height * 0.53, size.width * 0.91, size.height * 0.53);
    path.cubicTo(size.width * 0.91, size.height * 0.53, size.width * 0.87,
        size.height * 0.36, size.width * 0.87, size.height * 0.36);
    path.cubicTo(size.width * 0.87, size.height * 0.34, size.width * 0.87,
        size.height * 0.34, size.width * 0.86, size.height * 0.34);
    path.cubicTo(size.width * 0.86, size.height * 0.34, size.width * 0.84,
        size.height * 0.34, size.width * 0.84, size.height * 0.34);
    canvas.drawPath(path, paint);

    // canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    // canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.width),
    //     paint..blendMode = BlendMode.srcOver);
    // canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

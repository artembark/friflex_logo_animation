import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class FriflexAnimatedLogo extends StatefulWidget {
  const FriflexAnimatedLogo({
    Key? key,
  }) : super(key: key);

  @override
  State<FriflexAnimatedLogo> createState() => _FriflexAnimatedLogoState();
}

class _FriflexAnimatedLogoState extends State<FriflexAnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _transformFController;
  late Animation _rotateAnimation;
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
  late double horizontalDiagonalOffset;
  late double squareSize;

  @override
  void initState() {
    super.initState();
    _transformFController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 20000));
    _rotateAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 5.0, end: 3.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 1),
      TweenSequenceItem<double>(tween: ConstantTween<double>(3.0), weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: 3.0, end: 1.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 1)
    ]).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: Interval(
          0.0,
          0.3,
          curve: Curves.linear,
        ),
      ),
    );
    _step0PositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: Interval(
          0.0,
          0.1,
          curve: Curves.linear,
        ),
      ),
    );
    _step0LogoPositionAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: Interval(
          0.0,
          0.1,
          curve: Curves.linear,
        ),
      ),
    );
    _step0BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: 2.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(tween: ConstantTween<double>(2.0), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: 2.0, end: 0.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: Interval(
          0.0,
          0.1,
          curve: Curves.linear,
        ),
      ),
    );
    _step1ScaleAnimation = Tween<double>(begin: 3.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: Interval(
          0.1,
          0.2,
          curve: Curves.linear,
        ),
      ),
    );
    _step1BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: 2.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(tween: ConstantTween<double>(2.0), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: 2.0, end: 0.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: Interval(
          0.1,
          0.2,
          curve: Curves.linear,
        ),
      ),
    );
    _step2PositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: Interval(
          0.2,
          0.3,
          curve: Curves.linear,
        ),
      ),
    );
    _step2BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: 2.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(tween: ConstantTween<double>(2.0), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: 2.0, end: 0.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: Interval(
          0.2,
          0.3,
          curve: Curves.linear,
        ),
      ),
    );
    _step3PositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: Interval(
          0.3,
          0.4,
          curve: Curves.linear,
        ),
      ),
    );
    _step3BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: 2.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(tween: ConstantTween<double>(2.0), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: 2.0, end: 0.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: Interval(
          0.3,
          0.4,
          curve: Curves.linear,
        ),
      ),
    );
    _step4PositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: Interval(
          0.4,
          0.5,
          curve: Curves.linear,
        ),
      ),
    );
    _step4BlurAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: 2.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2),
      TweenSequenceItem<double>(tween: ConstantTween<double>(2.0), weight: 0.6),
      TweenSequenceItem(
          tween: Tween(begin: 2.0, end: 0.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
        parent: _transformFController,
        curve: Interval(
          0.4,
          0.5,
          curve: Curves.linear,
        ),
      ),
    );
    _transformFController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _transformFController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print('constraints.maxWidth=${constraints.maxWidth},'
          'constraints.minWidth=${constraints.minWidth},'
          'constraints.maxHeight=${constraints.maxHeight},'
          'constraints.minHeight=${constraints.minHeight},');

      squareSize = constraints.maxWidth * 200 / 670 / 3 / sqrt(2.0);
      final squareDiagonal = squareSize * sqrt(2.0) * 3;
      horizontalDiagonalOffset = squareSize * (1 + 1 / 2 * (sqrt(2) - 1));
      final logoWidth = constraints.maxWidth;
      //print(constraints.maxWidth * 490 / 670);
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Center(
          child: SizedBox(
            width: logoWidth,
            height: logoWidth * 200 / 670,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: SizedBox(
                    width: logoWidth * 490 / 670,
                    height: logoWidth * 490 / 670 * 132 / 490,
                    child: CustomPaint(
                      painter: FriflexPainter(),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(-_step0PositionAnimation.value * 300, 1),
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  left: _step0LogoPositionAnimation.value * logoWidth / 2,
                  bottom: 0,
                  child: SizedBox(
                    height: logoWidth * 160 / 670,
                    child: Transform.translate(
                      // offset: Offset(-_step0PositionAnimation.value * 135, 0),
                      offset: Offset(0, 0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Transform.translate(
                            offset: Offset(
                                horizontalDiagonalOffset *
                                    _step3PositionAnimation.value,
                                -squareSize /
                                    2.0 *
                                    3 *
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
                                    size: squareSize,
                                    scale: _step1ScaleAnimation.value,
                                    borderRadius: squareSize / 6.0,
                                    blurValue: _step4BlurAnimation.value,
                                  ),
                                ),
                                RectanglePart(
                                  size: squareSize,
                                  scale: _step1ScaleAnimation.value,
                                  borderRadius: squareSize / 6.0,
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
                              size: squareSize,
                              scale: _step1ScaleAnimation.value,
                              borderRadius: squareSize / 6.0,
                              blurValue: _step3BlurAnimation.value,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(
                                0,
                                -squareSize /
                                    2.0 *
                                    3 *
                                    _step2PositionAnimation.value),
                            child: RectangleSmall(
                              size: squareSize,
                              scale: _step1ScaleAnimation.value,
                              borderRadius: squareSize / 6.0,
                              blurValue: _step2BlurAnimation.value,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(
                                0,
                                squareSize /
                                    2.0 *
                                    3 *
                                    _step2PositionAnimation.value),
                            child: RectangleSmall(
                              size: squareSize,
                              scale: _step1ScaleAnimation.value,
                              borderRadius: squareSize / 6.0,
                              blurValue: _step2BlurAnimation.value,
                            ),
                          ),
                          Transform.scale(
                            scale: _step1ScaleAnimation.value,
                            child: Transform.rotate(
                              angle: pi / 4,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Center(
                                    child: Container(
                                      height: squareSize,
                                      width: squareSize,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            squareSize / 6.0),
                                        color: Color(0xff685bc7),
                                      ),
                                    ),
                                  ),
                                  ClipRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: _step1BlurAnimation.value,
                                          sigmaY: _step1BlurAnimation.value),
                                      child: InkWell(
                                        onTap: () =>
                                            _transformFController.forward(),
                                        child: Container(
                                          height: squareSize,
                                          width: squareSize,
                                          color: Colors.black.withOpacity(0),
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
                ),
              ],
            ),
          ),
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
    return Transform.scale(
      scale: scale,
      child: Transform.rotate(
        angle: pi / 4,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: Color(0xff685bc7),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Transform.translate(
                  //can't get rid of remaining 1px border of bigger container
                  offset: Offset(-1, 1),
                  child: Container(
                    height: size * 0.65,
                    width: size * 0.65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(borderRadius),
                          bottomLeft: Radius.circular(borderRadius),
                        ),
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: blurValue,
                  sigmaY: blurValue,
                ),
                child: Container(
                  height: size,
                  width: size,
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
    return Transform.scale(
      scale: scale,
      child: Transform.rotate(
        angle: pi / 4,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: Color(0xff685bc7)),
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: blurValue,
                  sigmaY: blurValue,
                ),
                child: Container(
                  height: size,
                  width: size,
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

class FriflexPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = Color(0xff1f1f1f);
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

    // Path number 2

    paint.color = Color(0xff1f1f1f);
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

    // Path number 3

    paint.color = Color(0xff1f1f1f);
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

    // Path number 4

    paint.color = Color(0xff1f1f1f);
    path = Path();
    path.lineTo(size.width / 3, size.height * 0.38);
    path.cubicTo(size.width / 3, size.height * 0.36, size.width / 3,
        size.height * 0.34, size.width * 0.34, size.height * 0.34);
    path.cubicTo(size.width * 0.34, size.height * 0.34, size.width * 0.36,
        size.height * 0.34, size.width * 0.36, size.height * 0.34);
    path.cubicTo(size.width * 0.36, size.height * 0.34, size.width * 0.37,
        size.height * 0.36, size.width * 0.37, size.height * 0.38);
    path.cubicTo(size.width * 0.37, size.height * 0.38, size.width * 0.37,
        size.height, size.width * 0.37, size.height);
    path.cubicTo(size.width * 0.37, size.height, size.width * 0.37, size.height,
        size.width * 0.37, size.height);
    path.cubicTo(size.width * 0.37, size.height, size.width / 3, size.height,
        size.width / 3, size.height);
    path.cubicTo(size.width / 3, size.height, size.width / 3, size.height,
        size.width / 3, size.height);
    path.cubicTo(size.width / 3, size.height, size.width / 3,
        size.height * 0.38, size.width / 3, size.height * 0.38);
    canvas.drawPath(path, paint);

    // Path number 5

    paint.color = Color(0xff685bc7);
    path = Path();
    path.lineTo(size.width * 0.34, size.height * 0.01);
    path.cubicTo(size.width * 0.34, 0, size.width * 0.35, 0, size.width * 0.36,
        size.height * 0.01);
    path.cubicTo(size.width * 0.36, size.height * 0.01, size.width * 0.37,
        size.height * 0.05, size.width * 0.37, size.height * 0.05);
    path.cubicTo(size.width * 0.37, size.height * 0.07, size.width * 0.37,
        size.height * 0.1, size.width * 0.37, size.height * 0.12);
    path.cubicTo(size.width * 0.37, size.height * 0.12, size.width * 0.36,
        size.height * 0.15, size.width * 0.36, size.height * 0.15);
    path.cubicTo(size.width * 0.35, size.height * 0.17, size.width * 0.34,
        size.height * 0.17, size.width * 0.34, size.height * 0.15);
    path.cubicTo(size.width * 0.34, size.height * 0.15, size.width / 3,
        size.height * 0.12, size.width / 3, size.height * 0.12);
    path.cubicTo(size.width * 0.32, size.height * 0.1, size.width * 0.32,
        size.height * 0.07, size.width / 3, size.height * 0.05);
    path.cubicTo(size.width / 3, size.height * 0.05, size.width * 0.34,
        size.height * 0.01, size.width * 0.34, size.height * 0.01);
    canvas.drawPath(path, paint);

    // Path number 6

    paint.color = Color(0xff1f1f1f);
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

    // Path number 7

    paint.color = Color(0xff1f1f1f);
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

    // Path number 8

    paint.color = Color(0xff1f1f1f);
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

    // Path number 9

    paint.color = Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(0, 0);
    path.cubicTo(0, 0, size.width, 0, size.width, 0);
    path.cubicTo(
        size.width, 0, size.width, size.height, size.width, size.height);
    path.cubicTo(size.width, size.height, 0, size.height, 0, size.height);
    path.cubicTo(0, size.height, 0, 0, 0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

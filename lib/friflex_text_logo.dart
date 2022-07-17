import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'friflex_i_painter.dart';

class FriflexTextLogo extends StatelessWidget {
  const FriflexTextLogo({
    Key? key,
    required this.logoWidth,
    required Animation iDotYPosition,
    required Animation iRectHeight,
    required Animation iDotRotation,
    required Animation iDotOpacity,
    required this.textColor,
    required this.rectColor,
  })  : _iDotYPosition = iDotYPosition,
        _iRectHeight = iRectHeight,
        _iDotRotation = iDotRotation,
        _iDotOpacity = iDotOpacity,
        super(key: key);

  final double logoWidth;
  final Animation _iDotYPosition;
  final Animation _iRectHeight;
  final Animation _iDotRotation;
  final Animation _iDotOpacity;
  final Color textColor;
  final Color rectColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                iDotYPosition: _iDotYPosition.value,
                iRectHeight: _iRectHeight.value,
                iDotRotation: _iDotRotation.value,
                iDotOpacity: _iDotOpacity.value,
                iRectColor: textColor,
                iDotColor: rectColor,
              ),
            ),
          ),
          SizedBox(
            width: logoWidth * 490 / 862,
            height: logoWidth * 132 / 862,
            child: SvgPicture.asset(
              'assets/logo.svg',
              fit: BoxFit.fill,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

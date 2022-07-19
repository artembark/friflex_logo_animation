import 'dart:math';

import 'package:flutter/material.dart';

abstract class LogoConst {
  LogoConst._();
  static const String svgLogoPath = 'assets/logo.svg';
  static const double smallSquareScale = 3.5;
  static const Color rectColor = Color(0xff685bc7);
  static const Color textColor = Colors.black;
  static const double blurOversize = 1.1;
  static const double rectRotation = pi / 4;
  //для Flutter Web, т.к. в нем нельзя устанавливать значение 0
  //в blur sigmaX или sigmaY, открытая issue
  //https://github.com/flutter/flutter/issues/89433
  static const double blurThreshold = 0.001;

}

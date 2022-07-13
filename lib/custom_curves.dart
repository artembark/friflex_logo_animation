import 'dart:math';

import 'package:flutter/material.dart';

///Похожа на [ElasticOutCurve], но с медленным
///началом и с средней пружиной в конце
class SlowStartLittleElasticOutCurve extends Curve {
  const SlowStartLittleElasticOutCurve({
    this.a = 0.15,
    this.w = 19.4,
  });

  final double a;
  final double w;
  final period = 0.4;

  @override
  double transformInternal(double t) {
    final double s = period / 4.0;
    t = t - 0.5;
    if (t < 0.0) {
      return 0.5 * pow(2.0, 14.0 * t) - 0.003906;
    } else {
      return pow(2.0, -10.0 * t) * sin((t - s) * (pi * 2.0) / period) * 0.5 +
          1.0;
    }
  }
}

///Похожа на [ElasticOutCurve], но с медленным
///началом и с пружиной в конце
class SlowStartElasticOutCurve extends Curve {
  const SlowStartElasticOutCurve({
    this.a = 0.46,
    this.w = 9.5,
  });

  final double a;
  final double w;
  final period = 0.4;

  @override
  double transformInternal(double t) {
    final double s = period / 4.0;
    t = t - 0.5;
    if (t < 0.0) {
      //return 0.5 * pow(2.0, 14.0 * t) - 0.003906;
      return t + 0.5;
    } else {
      return -0.5 * pow(e, -t / a) * cos(t * w) + 1.0;
    }
  }
}

///Похожа на [ElasticOutCurve], но с линейным
///началом и с пружиной в конце
class LinearStartElasticOutCurve extends Curve {
  const LinearStartElasticOutCurve({
    this.a = 0.15,
    this.w = 19.4,
  });

  final double a;
  final double w;
  final period = 0.4;

  @override
  double transformInternal(double t) {
    final double s = period / 4.0;
    t = t - 0.5;
    if (t < 0.0) {
      return t + 0.5;
    } else {
      return pow(2.0, -10.0 * t) * sin((t - s) * (pi * 2.0) / period) * 0.5 +
          1.0;
    }
  }
}

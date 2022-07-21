import 'dart:math';

import 'package:flutter/animation.dart';

class CustomCurves {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  CustomCurves._();

  static const Cubic easeOutBackCubicCustomCurve = Cubic(.22, .88, .47, 1.26);
  static const EaseOutBackCustomCurve easeOutBackCustomCurve =
      EaseOutBackCustomCurve();
  static const SlowStartMiddleElasticOutCurve slowStartMiddleElasticOutCurve =
      SlowStartMiddleElasticOutCurve();
}

///Похожа на [Curves.easeOutBack], но имее большее пиковое значение
class EaseOutBackCustomCurve extends Curve {
  const EaseOutBackCustomCurve({
    this.a = 0.32,
    this.w = 4.7,
  });

  final double a;
  final double w;

  @override
  double transformInternal(double t) {
    return -pow(e, -t / a) * cos(t * w) + 1.0;
  }
}

///Похожа на [Curves.elasticOut], но с медленным
///началом и более крупной раскачкой в конце
class SlowStartMiddleElasticOutCurve extends Curve {
  const SlowStartMiddleElasticOutCurve({
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
      //можно заменить начало на линейное
      //return t + 0.5;
    } else {
      return pow(2.0, -10.0 * t) * sin((t - s) * (pi * 2.0) / period) * 0.5 +
          1.0;
    }
  }
}

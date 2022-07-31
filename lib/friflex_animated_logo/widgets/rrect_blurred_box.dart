import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/utils/logo_const.dart';

class RRectBlurredBox extends LeafRenderObjectWidget {
  /// Кастомный Render Object для закругленного прямоугольника
  /// Виджет, рисующий прямоугольник с цветом [color],
  /// радиусом углов [borderRadius] и размытием [blurValue]
  const RRectBlurredBox(
      {this.color = Colors.white,
      this.borderRadius = 0,
      this.blurValue = 0,
      Key? key})
      : super(key: key);

  final Color color;
  final double borderRadius;
  final double blurValue;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderSquareBox(
        color: color, borderRadius: borderRadius, blurValue: blurValue);
  }

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    (renderObject as _RenderSquareBox)
      ..color = color
      ..borderRadius = borderRadius
      ..blurValue = blurValue;
  }
}

class _RenderSquareBox extends RenderProxyBox {
  _RenderSquareBox(
      {Color color = Colors.white,
      double borderRadius = 0,
      double blurValue = 0})
      : _color = color,
        _borderRadius = borderRadius,
        _blurValue = blurValue,
        super();

  /// The fill color for this render object.
  ///
  /// This parameter must not be null.
  Color get color => _color;
  Color _color;

  set color(Color value) {
    if (value == _color) {
      return;
    }
    _color = value;
    markNeedsPaint();
  }

  /// The border radius for this render object.
  ///
  /// This parameter must not be null.
  double get borderRadius => _borderRadius;
  double _borderRadius;

  set borderRadius(double value) {
    if (value == _borderRadius) {
      return;
    }
    _borderRadius = value;
    markNeedsPaint();
  }

  /// The blur value for this render object.
  ///
  /// This parameter must not be null.
  double get blurValue => _blurValue;
  double _blurValue;

  set blurValue(double value) {
    if (value == _blurValue) {
      return;
    }
    _blurValue = value;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (size > Size.zero) {
      context.canvas.save();
      context.canvas
          .translate(offset.dx + size.width / 2, offset.dy + size.height / 2);
      context.canvas.rotate(pi / 4);
      context.canvas.translate(
          -(offset.dx + size.width / 2), -(offset.dy + size.height / 2));
      context.canvas.drawRRect(
          RRect.fromRectAndRadius(
            offset & size,
            Radius.circular(borderRadius),
          ),
          Paint()
            ..color = LogoConst.squareColor
            ..style = PaintingStyle.fill
            ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurValue));
      context.canvas.restore();
    }
  }
}

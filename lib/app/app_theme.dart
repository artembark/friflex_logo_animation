import 'package:flutter/material.dart';

abstract class AppTheme {
  AppTheme._();

  static final appTheme = ThemeData(
    sliderTheme: SliderThemeData(
      activeTrackColor: sliderColor,
      inactiveTrackColor: sliderColor.withOpacity(0.5),
      thumbColor: sliderColor,
      overlayColor: sliderColor.withOpacity(0.2),
    ),
  );
  static const Color textColor = Colors.black;
  static const Color sliderColor = Color(0xFF685BC7);
  static const Color gradientStartColor = Color(0xFFEBDAFF);
  static const Color appBarBackgroundColor = Colors.transparent;
  static const double appBarElevation = 0.0;
  static const BoxDecoration backgroundGradient = BoxDecoration(
    gradient: RadialGradient(
      radius: 0.7,
      center: Alignment.topLeft,
      colors: [AppTheme.gradientStartColor, Colors.white],
    ),
  );
  static const EdgeInsets popupMenuButtonPadding = EdgeInsets.only(right: 16.0);
  static const TextStyle menuButtonTextStyle = TextStyle(
    color: AppTheme.textColor,
    fontWeight: FontWeight.bold,
  );
}

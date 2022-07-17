import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo.dart';

void main() {
  runApp(const FriflexLogoAnimationApp());
}

class FriflexLogoAnimationApp extends StatelessWidget {
  const FriflexLogoAnimationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: RadialGradient(
                      radius: 0.3,
                      center: Alignment.topLeft,
                      colors: [Color(0xFFEBDAFF), Colors.white])),
              child: const FriflexAnimatedLogo(
                duration: Duration(
                  milliseconds: 1500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo.dart';

void main() {
  runApp(const FriflexLogoAnimationApp());
}

class FriflexLogoAnimationApp extends StatelessWidget {
  const FriflexLogoAnimationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: FriflexAnimatedLogo(
            duration: Duration(
              milliseconds: 1500,
            ),
          ),
        ),
      ),
    );
  }
}

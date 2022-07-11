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
          body: SizedBox(
            //width: 335,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: FriflexAnimatedLogo(),
            ),
          ),
        ),
      ),
    );
  }
}

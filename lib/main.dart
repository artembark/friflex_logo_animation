import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/app/app_theme.dart';
import 'friflex_logo_animation_page.dart';

void main() {
  runApp(const FriflexLogoAnimationApp());
}

class FriflexLogoAnimationApp extends StatelessWidget {
  const FriflexLogoAnimationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: const SafeArea(
        child: FriflexLogoAnimationPage(),
      ),
    );
  }
}

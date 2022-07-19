import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'friflex_animated_logo.dart';

class FriflexLogoAnimationPage extends StatefulWidget {
  const FriflexLogoAnimationPage({Key? key}) : super(key: key);

  @override
  State<FriflexLogoAnimationPage> createState() =>
      _FriflexLogoAnimationPageState();
}

class _FriflexLogoAnimationPageState extends State<FriflexLogoAnimationPage> {
  GlobalKey<FriflexAnimatedLogoState> logoKey =
      GlobalKey<FriflexAnimatedLogoState>();

  final Uri _url =
      Uri.parse('https://github.com/artembark/friflex_logo_animation');
  int duration = 1500;
  double sliderValue = 0;
  bool sliderVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: sliderVisible ? buildAnimationSlider() : null,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          buildActions(),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 0.7,
            center: Alignment.topLeft,
            colors: [Color(0xFFEBDAFF), Colors.white],
          ),
        ),
        child: Center(
          child: FriflexAnimatedLogo(
            key: logoKey,
            duration: Duration(milliseconds: duration),
          ),
        ),
      ),
    );
  }

  Slider buildAnimationSlider() {
    return Slider(
      min: 0,
      max: 2,
      onChanged: (value) {
        if (value <= 1) {
          logoKey.currentState?.introController.value = value;
        }
        if (value >= 1) {
          logoKey.currentState?.transformController.value = value - 1;
        }
        setState(() {
          sliderValue = value;
        });
      },
      value: sliderValue,
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  Padding buildActions() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: PopupMenuButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
            //size: 40,
          ),
          itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                child: Text("Исходный код"),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text("Нормальная скорость"),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text("Замедленная скорость"),
              ),
              PopupMenuItem<int>(
                value: 3,
                child: sliderVisible
                    ? const Text("Скрыть слайдер")
                    : const Text("Показать слайдер"),
              ),
            ];
          },
          onSelected: (value) {
            switch (value) {
              case 0:
                _launchUrl(_url);
                break;
              case 1:
                setState(() {
                  sliderVisible = false;
                  sliderValue = 0;
                });
                setDurationReset(duration: 1500);
                break;
              case 2:
                setState(() {
                  sliderVisible = false;
                  sliderValue = 0;
                });
                setDurationReset(duration: 6000);
                break;
              case 3:
                if (!sliderVisible) {
                  logoKey.currentState?.transformController.reset();
                  logoKey.currentState?.introController.reset();
                }
                setState(() {
                  sliderValue = 0;
                  sliderVisible = !sliderVisible;
                });
                break;
            }
          }),
    );
  }

  void setDurationReset({required int duration}) {
    logoKey.currentState?.transformController.duration =
        Duration(milliseconds: duration);
    logoKey.currentState?.introController.duration =
        Duration(milliseconds: duration * 2);
    logoKey.currentState?.transformController.reset();
    logoKey.currentState?.introController.forward(from: 0.0);
  }
}

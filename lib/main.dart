import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/friflex_animated_logo.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const FriflexLogoAnimationApp());
}

class FriflexLogoAnimationApp extends StatelessWidget {
  const FriflexLogoAnimationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          sliderTheme: SliderThemeData(
              activeTrackColor: const Color(0xff685bc7),
              inactiveTrackColor: const Color(0x91685bc7),
              thumbColor: const Color(0xff685bc7),
              overlayColor: const Color(0xff685bc7).withOpacity(0.2))),
      home: const SafeArea(
        child: FriflexLogoAnimationHomePage(),
      ),
    );
  }
}

class FriflexLogoAnimationHomePage extends StatefulWidget {
  const FriflexLogoAnimationHomePage({Key? key}) : super(key: key);

  @override
  State<FriflexLogoAnimationHomePage> createState() =>
      _FriflexLogoAnimationHomePageState();
}

class _FriflexLogoAnimationHomePageState
    extends State<FriflexLogoAnimationHomePage> {
  GlobalKey<FriflexAnimatedLogoState> logoKey =
      GlobalKey<FriflexAnimatedLogoState>();
  final Uri _url =
      Uri.parse('https://github.com/artembark/friflex_logo_animation');
  int duration = 1500;
  double sliderValue = 0;
  bool sliderVisible = false;

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  void setDurationReset({required int duration}) {
    logoKey.currentState?.transformController.duration =
        Duration(milliseconds: duration);
    logoKey.currentState?.introController.duration =
        Duration(milliseconds: duration * 2);
    logoKey.currentState?.transformController.reset();
    logoKey.currentState?.introController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: sliderVisible
            ? Slider(
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
              )
            : null,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
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
                      setState(() {
                        sliderValue = 0;
                        sliderVisible = !sliderVisible;
                        logoKey.currentState?.transformController.reset();
                        logoKey.currentState?.introController.reset();
                      });
                      break;
                  }
                }),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
                radius: 0.7,
                center: Alignment.topLeft,
                colors: [Color(0xFFEBDAFF), Colors.white])),
        child: Center(
          child: FriflexAnimatedLogo(
            key: logoKey,
            duration: Duration(milliseconds: duration),
          ),
        ),
      ),
    );
  }
}

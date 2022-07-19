import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/app/app_const.dart';
import 'package:friflex_logo_animation/friflex_animated_logo/friflex_animated_logo.dart';
import 'package:url_launcher/url_launcher.dart';

class FriflexLogoAnimationPage extends StatefulWidget {
  const FriflexLogoAnimationPage({Key? key}) : super(key: key);

  @override
  State<FriflexLogoAnimationPage> createState() =>
      _FriflexLogoAnimationPageState();
}

class _FriflexLogoAnimationPageState extends State<FriflexLogoAnimationPage> {
  GlobalKey<FriflexAnimatedLogoState> logoKey =
      GlobalKey<FriflexAnimatedLogoState>();

  final Uri _url = Uri.parse(AppConst.sourceLink);
  int duration = AppConst.normalDuration;
  double sliderValue = AppConst.sliderInitValue;
  bool sliderVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          logoKey.currentState?.transformController.value = 0.0;
        }
        if (value >= 1) {
          logoKey.currentState?.introController.value = 1.0;
          logoKey.currentState?.transformController.value = value - 1.0;
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
          ),
          itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                child: Text(AppConst.sourceButtonText),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text(AppConst.normalSpeedButtonText),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text(AppConst.slowSpeedButtonText),
              ),
              PopupMenuItem<int>(
                value: 3,
                child: sliderVisible
                    ? const Text(AppConst.hideSliderButtonText)
                    : const Text(AppConst.showSliderButtonText),
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
                  sliderValue = AppConst.sliderInitValue;
                });
                setDurationReset(duration: AppConst.normalDuration);
                break;
              case 2:
                setState(() {
                  sliderVisible = false;
                  sliderValue = AppConst.sliderInitValue;
                });
                setDurationReset(duration: AppConst.slowDuration);
                break;
              case 3:
                if (!sliderVisible) {
                  logoKey.currentState?.transformController.reset();
                  logoKey.currentState?.introController.reset();
                }
                setState(() {
                  sliderValue = AppConst.sliderInitValue;
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

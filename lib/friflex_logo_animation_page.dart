import 'package:flutter/material.dart';
import 'package:friflex_logo_animation/app/app_const.dart';
import 'package:friflex_logo_animation/app/app_theme.dart';
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
  double sliderValue = AppConst.animationInitialValue;
  bool sliderVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: sliderVisible ? buildAnimationSlider() : null,
        backgroundColor: AppTheme.appBarBackgroundColor,
        elevation: AppTheme.appBarElevation,
        actions: [
          buildActions(),
        ],
      ),
      body: Container(
        decoration: AppTheme.backgroundGradient,
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
      min: AppConst.animationInitialValue,
      max: AppConst.animationFinalValue * 2,
      onChanged: (value) {
        if (value <= AppConst.animationFinalValue) {
          logoKey.currentState?.introController.value = value;
          logoKey.currentState?.transformController.value =
              AppConst.animationInitialValue;
        }
        if (value >= AppConst.animationFinalValue) {
          logoKey.currentState?.introController.value =
              AppConst.animationFinalValue;
          logoKey.currentState?.transformController.value =
              value - AppConst.animationFinalValue;
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
      padding: AppTheme.popupMenuButtonPadding,
      child: TooltipVisibility(
        visible: false,
        child: PopupMenuButton(
            child: Row(
              children: const [
                Icon(
                  Icons.menu,
                  color: AppTheme.textColor,
                ),
                Text(
                  AppConst.settingsButtonText,
                  style: TextStyle(
                    color: AppTheme.textColor,
                  ),
                ),
              ],
            ),
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: AppConst.pmSourceButtonIndex,
                  child: Text(AppConst.sourceButtonText),
                ),
                const PopupMenuItem<int>(
                  value: AppConst.pmNormalSpeedButtonIndex,
                  child: Text(AppConst.normalSpeedButtonText),
                ),
                const PopupMenuItem<int>(
                  value: AppConst.pmSlowSpeedButtonIndex,
                  child: Text(AppConst.slowSpeedButtonText),
                ),
                PopupMenuItem<int>(
                  value: AppConst.pmSliderVisibilityButtonIndex,
                  child: sliderVisible
                      ? const Text(AppConst.hideSliderButtonText)
                      : const Text(AppConst.showSliderButtonText),
                ),
              ];
            },
            onSelected: (value) {
              switch (value) {
                case AppConst.pmSourceButtonIndex:
                  _launchUrl(_url);
                  break;
                case AppConst.pmNormalSpeedButtonIndex:
                  setDurationReset(duration: AppConst.normalDuration);
                  break;
                case AppConst.pmSlowSpeedButtonIndex:
                  setDurationReset(duration: AppConst.slowDuration);
                  break;
                case AppConst.pmSliderVisibilityButtonIndex:
                  if (sliderVisible) {
                    setDurationReset(duration: AppConst.normalDuration);
                  } else {
                    setState(() {
                      sliderVisible = true;
                      sliderValue = AppConst.animationFinalValue;
                    });
                    logoKey.currentState?.introController.value =
                        AppConst.animationFinalValue;
                    logoKey.currentState?.transformController.value =
                        AppConst.animationInitialValue;
                  }
                  break;
              }
            }),
      ),
    );
  }

  void setDurationReset({required int duration}) {
    setState(() {
      sliderVisible = false;
    });
    logoKey.currentState?.transformController.duration =
        Duration(milliseconds: duration);
    logoKey.currentState?.introController.duration =
        Duration(milliseconds: duration * 2);
    logoKey.currentState?.transformController.reset();
    logoKey.currentState?.introController
        .forward(from: AppConst.animationInitialValue);
  }
}

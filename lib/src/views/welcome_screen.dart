import 'package:flutter/material.dart';
import 'package:flutterfoo/src/controllers/welcome_controller.dart';
import 'package:flutterfoo/src/widgets/welcome_screen/coursal_images.dart';
import 'package:flutterfoo/src/widgets/welcome_screen/coursal_indicator.dart';
import 'package:flutterfoo/src/widgets/welcome_screen/custom_buttons.dart';
import 'package:flutterfoo/src/widgets/welcome_screen/welcome_screen_hero_text.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  WelcomeController get controller => Get.find<WelcomeController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final topPadding = (size.height * 0.05).clamp(16.0, 50.0);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: Column(
              children: [
                const WelcomeScreenHeroText(),
                const CoursalImages(),
                const CoursalIndicator(),
                CustomContinueButton(buttonText: "Continue", () {
                  if (controller.isLastSlide) {
                    Get.toNamed("/sign_in");
                    return;
                  }

                  controller.changeIndex(controller.currentIndex.value + 1);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

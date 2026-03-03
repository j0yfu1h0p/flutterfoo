import 'package:flutter/material.dart';
import 'package:flutterfoo/src/controllers/welcome_controller.dart';
import 'package:get/get.dart';

class CoursalImages extends StatelessWidget {
  const CoursalImages({super.key});

  WelcomeController get controller => Get.find<WelcomeController>();

  final List<String> images = const [
    'assets/images/coursal1.png',
    'assets/images/coursal2.png',
    'assets/images/coursal3.png',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final topPadding = (size.height * 0.06).clamp(24.0, 90.0);
    final horizontalPadding = (size.width * 0.12).clamp(16.0, 45.0);
    final imageHeight = (size.height * 0.36).clamp(180.0, 340.0);

    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        left: horizontalPadding,
        right: horizontalPadding,
      ),
      child: SizedBox(
        height: imageHeight,
        width: double.infinity,
        child: Obx(() {
          final int currentIndex = controller.currentIndex.value;
          return GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity == null) return;

              if (details.primaryVelocity! < 0) {
                // Swiped left
                if (!controller.isLastSlide) {
                  controller.changeIndex(currentIndex + 1);
                }
              } else if (details.primaryVelocity! > 0) {
                // Swiped right
                if (!controller.isFirstSlide) {
                  controller.changeIndex(currentIndex - 1);
                }
              }
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.linearToEaseOut,
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(scale: animation, child: child),
                );
              },
              child: Image.asset(
                images[currentIndex],
                key: ValueKey<int>(currentIndex),
                fit: BoxFit.contain,
              ),
            ),
          );
        }),
      ),
    );
  }
}

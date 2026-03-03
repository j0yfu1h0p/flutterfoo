import 'package:flutter/material.dart';
import 'package:flutterfoo/src/controllers/welcome_controller.dart';
import 'package:get/get.dart';

class CoursalIndicator extends StatelessWidget {
  const CoursalIndicator({super.key});

  WelcomeController get controller => Get.find<WelcomeController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final topPadding = (size.height * 0.04).clamp(16.0, 50.0);
    final dotHeight = (size.width * 0.022).clamp(8.0, 12.0);
    final activeWidth = dotHeight * 2.5;
    final spacing = dotHeight * 0.8;

    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Obx(() {
        final int currentIndex = controller.currentIndex.value;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(WelcomeController.slideCount, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: spacing / 2),
              child: _buildDot(
                isActive: currentIndex == index,
                height: dotHeight,
                activeWidth: activeWidth,
              ),
            );
          }),
        );
      }),
    );
  }

  Widget _buildDot({
    required bool isActive,
    required double height,
    required double activeWidth,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: height,
      width: isActive ? activeWidth : height,
      decoration: BoxDecoration(
        color: isActive
            ? Colors.orange
            : const Color.fromARGB(255, 143, 142, 140),
        borderRadius: BorderRadius.circular(height),
      ),
    );
  }
}

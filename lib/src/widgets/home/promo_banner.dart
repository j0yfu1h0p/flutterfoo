import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? backgroundColor;

  const PromoBanner({
    Key? key,
    required this.title,
    required this.subtitle,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double bannerHeight = screenWidth * 0.4;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: double.infinity,
        height: bannerHeight.clamp(140.0, 180.0),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: backgroundColor ?? Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(
              top: -200,
              right: -120,
              child: Transform.rotate(
                angle: -0.5,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.orange[300],
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 150,
              right: 50,
              child: Transform.rotate(
                angle: -0.5,
                child: Container(
                  width: 500,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.orange[300],
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      height: 1.5,
                      letterSpacing: 2.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

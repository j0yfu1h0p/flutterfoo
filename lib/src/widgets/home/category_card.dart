import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback? onTap;

  const CategoryCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth = (screenWidth * 0.62).clamp(220.0, 300.0);
    final double cardHeight = (screenWidth * 0.37).clamp(120.0, 170.0);

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              imageUrl.startsWith('http')
                  ? Image.network(imageUrl, fit: BoxFit.cover)
                  : Image.asset(imageUrl, fit: BoxFit.cover),
              Container(color: Colors.black.withOpacity(0.25)),
              Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

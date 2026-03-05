import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final String description;

  const ProductDescription({Key? key, required this.description})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontSize = (screenWidth * 0.04).clamp(14.0, 16.0);
    final double headingFontSize = (screenWidth * 0.045).clamp(16.0, 20.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontSize: headingFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.grey[700],
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

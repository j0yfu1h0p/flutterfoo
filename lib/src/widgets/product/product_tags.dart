import 'package:flutter/material.dart';

class ProductTags extends StatelessWidget {
  final List<String> tags;

  const ProductTags({Key? key, required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (tags.isEmpty) return const SizedBox.shrink();

    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontSize = (screenWidth * 0.035).clamp(12.0, 14.0);
    final double headingFontSize = (screenWidth * 0.045).clamp(16.0, 20.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tags',
          style: TextStyle(
            fontSize: headingFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: tags.map((tag) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tag,
                style: TextStyle(color: Colors.grey[700], fontSize: fontSize),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

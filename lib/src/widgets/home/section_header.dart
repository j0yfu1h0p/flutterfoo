import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onActionTap;

  const SectionHeader({
    Key? key,
    required this.title,
    this.actionText = 'See More',
    this.onActionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontSize = (screenWidth * 0.045).clamp(16.0, 20.0);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          if (actionText != null)
            GestureDetector(
              onTap: onActionTap,
              child: Text(
                actionText!,
                style: TextStyle(
                  fontSize: fontSize * 0.78,
                  color: Colors.orange,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

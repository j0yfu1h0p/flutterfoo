import 'package:flutter/material.dart';

class ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const ActionItem({
    Key? key,
    required this.icon,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double itemSize = (screenWidth * 0.16).clamp(56.0, 72.0);

    return SizedBox(
      width: itemSize,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: const Color(0xFFFFECDF),
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: onTap,
              child: SizedBox(
                height: itemSize,
                width: itemSize,
                child: Icon(
                  icon,
                  size: itemSize * 0.54,
                  color: const Color(0xFFFF7643),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 42,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

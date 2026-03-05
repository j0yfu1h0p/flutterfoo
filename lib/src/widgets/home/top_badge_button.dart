import 'package:flutter/material.dart';

class TopBadgeButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final int badgeCount;

  const TopBadgeButton({
    Key? key,
    required this.icon,
    this.onTap,
    this.badgeCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double size = (screenWidth * 0.13).clamp(48.0, 60.0);

    return Material(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(25),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: onTap,
        child: SizedBox(
          height: size,
          width: size,
          child: Stack(
            children: [
              Center(child: Icon(icon)),
              if (badgeCount > 0)
                Positioned(
                  top: size * 0.15,
                  right: size * 0.15,
                  child: Container(
                    width: size * 0.18,
                    height: size * 0.18,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        badgeCount > 9 ? '9+' : '$badgeCount',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size * 0.1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

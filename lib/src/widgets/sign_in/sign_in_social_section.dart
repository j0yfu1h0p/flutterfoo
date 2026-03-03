import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class SignInSocialSection extends StatelessWidget {
  const SignInSocialSection({
    super.key,
    required this.screenWidth,
    required this.onOpenSocialLink,
  });

  final double screenWidth;
  final Future<void> Function(String link) onOpenSocialLink;

  Widget _socialCircle({required Widget child}) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        color: Color(0xFFF2F3F7),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => onOpenSocialLink('https://accounts.google.com/'),
          borderRadius: BorderRadius.circular(40),
          child: _socialCircle(
            child: const HugeIcon(
              icon: HugeIcons.strokeRoundedGoogle,
              color: Color(0xFFEA4335),
              size: 32,
              strokeWidth: 1.8,
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.05),
        InkWell(
          onTap: () => onOpenSocialLink('https://www.facebook.com/login/'),
          borderRadius: BorderRadius.circular(40),
          child: _socialCircle(
            child: const HugeIcon(
              icon: HugeIcons.strokeRoundedFacebook01,
              color: Color(0xFF3B5998),
              size: 32,
              strokeWidth: 1.8,
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.05),
        InkWell(
          onTap: () => onOpenSocialLink('https://twitter.com/i/flow/login'),
          borderRadius: BorderRadius.circular(40),
          child: _socialCircle(
            child: const HugeIcon(
              icon: HugeIcons.strokeRoundedTwitter,
              color: Color(0xFF1DA1F2),
              size: 32,
              strokeWidth: 1.8,
            ),
          ),
        ),
      ],
    );
  }
}

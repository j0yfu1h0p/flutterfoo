import 'package:flutter/material.dart';

class SignInHeaderSection extends StatelessWidget {
  const SignInHeaderSection({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: screenWidth * 0.08),
          child: Text(
            'Welcome Back',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: screenWidth * 0.1,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.1),
          child: Text(
            'Sign in with your email and password or continue with social media',
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
